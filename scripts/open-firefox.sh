
firefox --new-window 'https://www.meteoblue.com/ro/vreme/14-zile/%C5%9Etefan-cel-mare_rom%C3%A2nia_666248'

# Așteaptă până fereastra apare
sleep 1.2

# Focalizează fereastra după class exact
hyprctl dispatch focuswindow "firefox"

# Aplică resize și poziționare

# O setează flotant
hyprctl dispatch floatwindow

# Redimensionare și poziționare
sleep 0.2
hyprctl dispatch movewindowpixel exact 200 200
hyprctl dispatch resizewindowpixel exact 400 400
