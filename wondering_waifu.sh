#!/bin/bash

# Directory containing your wallpapers
wallpaper_dir="/home/bluecake/Pictures/Wallpapers/"

# Error handling if directory doesn't exist
if [ ! -d "$wallpaper_dir" ]; then
  echo "Error: Wallpaper directory '$wallpaper_dir' does not exist."
  exit 1
fi

# Function to get a random wallpaper path
get_random_wallpaper() {
  shopt -s nullglob # Allow null globbing for empty directory
  wallpapers=("$wallpaper_dir"/*)  # Array of wallpaper paths
  shopt -u nullglob  # Disable null globbing
  if [[ ${#wallpapers[@]} -eq 0 ]]; then
    echo "Error: No wallpapers found in '$wallpaper_dir'."
    exit 1
  fi
  random_index=$((RANDOM % ${#wallpapers[@]}))
  echo "${wallpapers[$random_index]}"
}

# Main loop
while true; do
  # Get a random wallpaper path
  wallpaper_path=$(get_random_wallpaper)

  # Set the wallpaper using feh with background scaling
  feh --bg-scale "$wallpaper_path"

  # Sleep for 30 seconds
  sleep 15
done

