#!/usr/bin/env fish

# Path to the folder containing your wallpapers
set wallpaper_dir ~/Wallpapers

# Get the list of wallpaper files
set wallpapers (ls $wallpaper_dir)

# Function to set wallpaper and apply pywal theme
function set_wallpaper
    # Set the wallpaper using swww
    swww img $argv[1] --transition-type wipe --transition-angle 30 --transition-step 90

    # Apply the pywal theme
    wal -i $argv[1]
end

# Loop to rotate wallpapers
while true
    for wallpaper in $wallpapers
        set_wallpaper $wallpaper_dir/$wallpaper
        sleep 120
    end
end

