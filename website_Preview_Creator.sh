#!/bin/bash

# Ask the user for the website URL
read -p "Enter the website URL: " website_url

# Ask the user for the website name, description, and image
read -p "Enter the website name: " website_name
read -p "Enter the website description: " website_description
read -p "Enter the website image URL: " website_image_url

# Construct the HTML code for the website preview
website_preview="<html><head><meta http-equiv=\"refresh\" content=\"0; URL='$website_url'\" /><title>$website_name</title></head><body><h1>$website_name</h1><p>$website_description</p><a href=\"$website_url\"><img src=\"$website_image_url\"></a></body></html>"

# Display the website preview in the default web browser
echo "$website_preview" > preview.html

# Ask the user if they want to open the website in the browser
read -p "Do you want to open the website in the browser? (y/n): " open_browser

# Check the user's answer and open the browser if they said yes
if [ "$open_browser" = "y" ] || [ "$open_browser" = "Y" ]; then
  xdg-open "$website_url"
else
  echo "Website preview created in preview.html."
fi
