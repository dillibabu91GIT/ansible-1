#!/bin/bash

Profile_home="$1"
zip_file_url="$2"
zip_file_name="$3"

# Remove the existing release directory if it exists
rm -rf "$Profile_home/release"

# Use unzip to extract contents into the specified directory
unzip -q "$Profile_home/$zip_file_name" -d "$Profile_home/"

# List files after extraction in the specified path
ls -la "$Profile_home/release"
ls -la "$Profile_home/release/WFS.ear"

# Read the content of release.txt
release_content=$(cat "$Profile_home/release/release.txt" 2>/dev/null)

# Print the content of release_content
echo "$release_content"

# Deploy new files for each application
if [ -n "$release_content" ]; then
    targeted_location="$targeted_location"

    # Iterate through each line in release_content
    while IFS=, read -r app_name app_targeted_location; do
        # Check if the app_targeted_location is not empty
        if [ -n "$app_targeted_location" ]; then
            # Define paths for new deployment files and targeted location
            new_deployment_path="$Profile_home/release/$app_name"  # Assuming the new files are in the release directory
            targeted_path="$targeted_location/$app_targeted_location"

            # Copy new deployment files to targeted location
            cp -r "$new_deployment_path" "$targeted_path"

            # Print information about the copy
            echo "Copy: $app_name - $new_deployment_path -> $targeted_path"
        fi
    done <<< "$release_content"
fi
