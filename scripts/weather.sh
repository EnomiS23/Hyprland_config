#!/bin/sh

source "$HOME/.config/eww/scripts/weather1.txt"

NOW=$(date +%s)

ICON=""

# Funcție ca să determinăm dacă e noapte
is_night() {
  [ "$NOW" -lt "$sunrise" ] || [ "$NOW" -gt "$sunset" ]
}

if is_night; then
    case "$descriere" in
        "thunderstorm with light rain") ICON="icons/ploua_cu_fulgere.png" ;;
     	"thunderstorm with rain") ICON="icons/ploua_cu_fulgere.png";; 
        "thunderstorm with heavy rain") ICON="icons/ploua_cu_fulgere.png";;
        "light thunderstorm") ICON="icons/ploua_cu_fulgere.png";; 
        "thunderstorm") ICON="icons/ploua_cu_fulgere.png" ;;
        "heavy thunderstorm") ICON="icons/ploua_cu_fulgere.png";;
        "ragged thunderstorm") ICON="icons/ploua_cu_fulgere.png";;
        "thunderstorm with light drizzle") ICON="icons/ploua_cu_fulgere.png";;
        "thunderstorm with drizzle") ICON="icons/ploua_cu_fulgere.png" ;;
        "thunderstorm with heavy drizzle") ICON="icons/ploua_cu_fulgere.png";;
        "light intensity drizzle") ICON="icons/ploaie_marunta.png" ;;
        "drizzle") ICON="icons/ploaie_marunta.png" ;;
        "heavy intensity drizzle") ICON="icons/ploaie_marunta.png" ;;
        "light intensity drizzle rain") ICON="icons/ploaie_marunta.png" ;; 
        "drizzle rain") ICON="icons/ploaie_marunta.png"  ;;
        "heavy intensity drizzle rain") ICON="icons/ploaie.png"  ;;
        "shower rain and drizzle") ICON="icons/ploaie.png"  ;;
        "heavy shower rain and drizzle") ICON="icons/ploaie.png"  ;;
        "shower drizzle") ICON="icons/ploaie.png"   ;;
        "light rain") ICON="icons/ploaie_marunta.png";;
        "moderate rain") ICON="icons/ploaie_marunta.png";;
        "heavy intensity rain") ICON="icons/ploaie.png"  ;;
        "very heavy rain") ICON="icons/ploaie.png" ;; 
        "extreme rain") ICON="icons/ploaie.png"  ;;
        "freezing rain") ICON="icons/ploaie.png"  ;;
        "light intensity shower rain") ICON="icons/ploaie_marunta.png";;
        "shower rain") ICON="icons/ploaie_marunta.png";;
        "heavy intensity shower rain") ICON="icons/ploaie.png";;
        "ragged shower rain") ICON="icons/ploaie.png";;
        "light snow" ) ICON="icons/ninge.png";;
        "heavy snow" ) ICON="icons/ninge.png";;
        "sleet" ) ICON="icons/ninge.png";;
        "light shower sleet") ICON="icons/ninge.png";;
        "shower sleet") ICON="icons/ninge.png";;
        "light rain and snow") ICON="icons/ninge.png";;
        "rain and snow") ICON="icons/ninge.png";;
        "light shower snow") ICON="icons/ninge.png";;
        "shower snow") ICON="icons/ninge.png";;
        "heavy shower snow") ICON="icons/ninge.png";;
        "smoke") ICON="icons/mist.png";;
        "haze") ICON="icons/mist.png";;
        "sand/dust whirls") ICON="icons/mist.png" ;;
        "fog") ICON="icons/mist.png";;
        "sand") ICON="icons/mist.png";;
        "dust") ICON="icons/mist.png" ;;
        "volcanic ash") ICON="icons/mist.png";;
        "squalls") ICON="icons/mist.png";;
        "tornado") ICON="icons/mist.png";;
        "clear sky") ICON="icons/seara_clear.png" ;;
        "few clouds") ICON="icons/luna_innorat.png" ;;
        "scattered clouds") ICON="icons/innorat.png" ;;
        "broken clouds") ICON="icons/luna_innorat.png" ;;
        "shower rain") ICON="icons/ploaie_marunta.png" ;;
        "moderate rain") ICON="icons/ploaie.png" ;;
        "thunderstorm") ICON="icons/ploua_cu_fulgere.png" ;;
        "snow") ICON="icons/ninge.png" ;;
        "mist") ICON="icons/mist.png" ;;
        *) ICON="icons/seara_clear.png" ;;
    esac
else
    case "$descriere" in
        "clear sky") ICON="icons/clear.png" ;;
        "thunderstorm with light rain") ICON="icons/ploua_cu_fulgere.png" ;;
     	"thunderstorm with rain") ICON="icons/ploua_cu_fulgere.png";; 
        "thunderstorm with heavy rain") ICON="icons/ploua_cu_fulgere.png";;
        "light thunderstorm") ICON="icons/ploua_cu_fulgere.png";; 
        "thunderstorm") ICON="icons/ploua_cu_fulgere.png" ;;
        "heavy thunderstorm") ICON="icons/ploua_cu_fulgere.png";;
        "ragged thunderstorm") ICON="icons/ploua_cu_fulgere.png";;
        "thunderstorm with light drizzle") ICON="icons/ploua_cu_fulgere.png";;
        "thunderstorm with drizzle") ICON="icons/ploua_cu_fulgere.png" ;;
        "thunderstorm with heavy drizzle") ICON="icons/ploua_cu_fulgere.png";;
        "light intensity drizzle") ICON="icons/ploaie_marunta.png" ;;
        "drizzle") ICON="icons/ploaie_marunta.png" ;;
        "heavy intensity drizzle") ICON="icons/ploaie_marunta.png" ;;
        "light intensity drizzle rain") ICON="icons/ploaie_marunta.png" ;; 
        "drizzle rain") ICON="icons/ploaie_marunta.png"  ;;
        "heavy intensity drizzle rain") ICON="icons/ploaie.png"  ;;
        "shower rain and drizzle") ICON="icons/ploaie.png"  ;;
        "heavy shower rain and drizzle") ICON="icons/ploaie.png"  ;;
        "shower drizzle") ICON="icons/ploaie.png"   ;;
        "light rain") ICON="icons/ploaie_marunta.png";;
        "moderate rain") ICON="icons/ploaie_marunta.png";;
        "heavy intensity rain") ICON="icons/ploaie.png"  ;;
        "very heavy rain") ICON="icons/ploaie.png" ;; 
        "extreme rain") ICON="icons/ploaie.png"  ;;
        "freezing rain") ICON="icons/ploaie.png"  ;;
        "light intensity shower rain") ICON="icons/ploaie_marunta.png";;
        "shower rain") ICON="icons/ploaie_marunta.png";;
        "heavy intensity shower rain") ICON="icons/ploaie.png";;
        "ragged shower rain") ICON="icons/ploaie.png";;
        "light snow" ) ICON="icons/ninge.png";;
        "heavy snow" ) ICON="icons/ninge.png";;
        "sleet" ) ICON="icons/ninge.png";;
        "light shower sleet") ICON="icons/ninge.png";;
        "shower sleet") ICON="icons/ninge.png";;
        "light rain and snow") ICON="icons/ninge.png";;
        "rain and snow") ICON="icons/ninge.png";;
        "light shower snow") ICON="icons/ninge.png";;
        "shower snow") ICON="icons/ninge.png";;
        "heavy shower snow") ICON="icons/ninge.png";;
        "smoke") ICON="icons/mist.png";;
        "haze") ICON="icons/mist.png";;
        "sand/dust whirls") ICON="icons/mist.png" ;;
        "fog") ICON="icons/mist.png";;
        "sand") ICON="icons/mist.png";;
        "dust") ICON="icons/mist.png" ;;
        "volcanic ash") ICON="icons/mist.png";;
        "squalls") ICON="icons/mist.png";;
        "tornado") ICON="icons/mist.png";;
        "few clouds") ICON="icons/soare_innorat.png" ;;
        "scattered clouds") ICON="icons/innorat.png" ;;
        "broken clouds") ICON="icons/soare_innorat.png" ;;
        "shower rain") ICON="icons/ploaie_marunta.png" ;;
        "moderate rain") ICON="icons/ploaie.png" ;;
        "thunderstorm") ICON="icons/ploaie_cu_fulgere.png" ;;
        "snow") ICON="icons/ninge.png" ;;
        "mist") ICON="icons/mist.png" ;;
        *) ICON="icons/clear.png" ;;
    esac
fi


echo "$ICON"
