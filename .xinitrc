xset r rate 200 30

xrandr \
	--output DP-1 --mode 1920x1080 --rate 144 \
	--output DP-2 --mode 1920x1080 --rate 60

exec qtile
