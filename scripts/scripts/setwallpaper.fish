#!/usr/bin/env fish

set WALLPAPER_DIR "~/Wallpapers"
set INTERVAL 60

while true
	for FILE in $WALLPAPER_DIR/*
		swww img $FILE --transition-step 15 --transition-fps 60 --transition-type wipe
		wal -i $FILE
		sleep $INTERVAL
	end
end

