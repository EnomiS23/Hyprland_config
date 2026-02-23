LAST_STATE="none"

while true; do
    active_window=$(hyprctl activewindow -j | jq -r '.class // empty')

    if [ -n "$active_window" ]; then
        # Avem o fereastră activă → ascunde widgeturile
        if [ "$LAST_STATE" != "hidden" ]; then
            eww close ex
            eww close weather_window

            # Închide cava și rmpc corect
            pkill -f "kitty --class cava_widget"
            #pkill -f "kitty --class rmpc_widget"

            LAST_STATE="hidden"
        fi
    else
        # Nu avem fereastră activă → arată widgeturile
        if [ "$LAST_STATE" != "visible" ]; then
            eww open ex
            eww open weather_window

            # Pornește cava
            "$HOME/.config/eww/scripts/launch_cava.sh"

            # Pornește rmpc
            #"$HOME/.config/eww/scripts/launch_rmpc.sh"

            LAST_STATE="visible"
        fi
    fi

    sleep 0.5
done