#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# weather info from wttr. https://github.com/chubin/wttr.in
# City auto-detected via IP

cachedir=~/.cache/rbn
cachefile="weather-cache"

mkdir -p "$cachedir"
touch "$cachedir/$cachefile"

# Save current IFS
SAVEIFS=$IFS
IFS=$'\n'

cacheage=$(($(date +%s) - $(stat -c '%Y' "$cachedir/$cachefile")))

# Update if cache is older than 29 minutes or empty
if [ $cacheage -gt 1740 ] || [ ! -s "$cachedir/$cachefile" ]; then
    data=($(curl -s "https://wttr.in/?0qnT"))
    
    echo ${data[0]} | cut -f1 -d, > "$cachedir/$cachefile"
    echo ${data[1]} | sed -E 's/^.{15}//' >> "$cachedir/$cachefile"
    echo ${data[2]} | sed -E 's/^.{15}//' >> "$cachedir/$cachefile"
fi

weather=($(cat "$cachedir/$cachefile"))

IFS=$SAVEIFS

temperature=$(echo ${weather[2]} | sed -E 's/([[:digit:]]+)\.\./\1 to /g')

case $(echo ${weather[1]##*,} | tr '[:upper:]' '[:lower:]') in
"clear" | "sunny") condition="" ;;
"partly cloudy") condition="󰖕" ;;
"cloudy") condition="" ;;
"overcast") condition="" ;;
"fog" | "freezing fog") condition="" ;;
"patchy rain possible" | "patchy light drizzle" | "light drizzle" | "patchy light rain" | "light rain" | "light rain shower" | "mist" | "rain") condition="󰼳" ;;
"moderate rain at times" | "moderate rain" | "heavy rain at times" | "heavy rain" | "moderate or heavy rain shower" | "torrential rain shower" | "rain shower") condition="" ;;
"patchy snow possible" | "patchy sleet possible" | "patchy freezing drizzle possible" | "freezing drizzle" | "heavy freezing drizzle" | "light freezing rain" | "moderate or heavy freezing rain" | "light sleet" | "ice pellets" | "light sleet showers" | "moderate or heavy sleet showers") condition="󰼴" ;;
"blowing snow" | "moderate or heavy sleet" | "patchy light snow" | "light snow" | "light snow showers") condition="󰙿" ;;
"blizzard" | "patchy moderate snow" | "moderate snow" | "patchy heavy snow" | "heavy snow" | "moderate or heavy snow with thunder" | "moderate or heavy snow showers") condition="" ;;
"thundery outbreaks possible" | "patchy light rain with thunder" | "moderate or heavy rain with thunder" | "patchy light snow with thunder") condition="" ;;
*) condition="" ;;
esac

# JSON for Waybar / Hyprlock compat
echo -e "{\"text\":\"$temperature $condition\", \"alt\":\"${weather[0]}\", \"tooltip\":\"${weather[0]}: $temperature ${weather[1]}\"}"

cached_weather=" $temperature\n$condition ${weather[1]}"
echo -e "$cached_weather" > ~/.cache/.weather_cache
