#!/bin/bash

# Function to get valid input
get_input() {
    local prompt="$1"
    local var
    while true; do
        read -p "$prompt" var
        if [ -n "$var" ]; then
            echo "$var"
            return
        else
            echo "Input cannot be empty. Please try again."
        fi
    done
}

# Get valid inputs
website_url=$(get_input "Enter the website URL: ")
website_name=$(get_input "Enter the website name: ")
website_description=$(get_input "Enter the website description: ")
website_image_url=$(get_input "Enter the website image URL: ")

# Construct the HTML code for the website preview
website_preview="<html>
<head>
    <meta http-equiv=\"refresh\" content=\"0; URL='$website_url'\" />
    <title>$website_name</title>
</head>
<body>
    <h1>$website_name</h1>
    <p>$website_description</p>
    <a href=\"$website_url\">
        <img src=\"$website_image_url\" alt=\"$website_name Image\">
    </a>
</body>
</html>"

# Save the website preview to a file
echo "$website_preview" > preview.html

# Loop for valid confirmation input
while true; do
    read -p "Do you want to open the website in the browser? (yes/y or no/n): " open_browser
    case "${open_browser,,}" in  # Convert input to lowercase
        yes|y)
            xdg-open "$website_url"
            break
            ;;
        no|n)
            echo "Website preview created in preview.html."
            break
            ;;
        *)
            echo "Invalid input. Please answer 'yes/y' or 'no/n'."
            ;;
    esac
done
