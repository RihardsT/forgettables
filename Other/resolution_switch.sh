### Existing modes
xrandr --output HDMI-1 --mode 1920x1080
xrandr --output HDMI-1 --mode 2560x1440

#### Custom resolution
# https://gist.github.com/sohailshaukat/68fbf86ed8375c94a7a9e1c342897f81

gtf 960 1080 60
Modeline "960x1080_60.00"  86.94  960 1024 1128 1296  1080 1081 1084 1118  -HSync +Vsync
xrandr --newmode "960x1080_60.00"  86.94  960 1024 1128 1296  1080 1081 1084 1118  -HSync +Vsync
xrandr --addmode HDMI-1 "960x1080_60.00"
xrandr --output HDMI-1 --mode "960x1080_60.00"

# Nicer dual picture.
1280x1440
gtf 1280 1440 59.95
xrandr --newmode "1280x1440_59.95"  155.78  1280 1376 1512 1744  1440 1441 1444 1490  -HSync +Vsync
xrandr --addmode HDMI-1 "1280x1440_59.95"
xrandr --output HDMI-1 --mode "1280x1440_59.95"
