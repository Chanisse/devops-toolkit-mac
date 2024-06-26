#!/bin/bash

# Function to check if the last command was successful
check_command_success() {
    if [ $? -eq 0 ]; then
        echo "Command executed successfully."
    else
        echo "Command failed."
        read -p "Press enter to continue or type 'exit' to exit: " choice
        if [[ "$choice" == "exit" ]]; then
            exit 1
        fi
    fi
}

###############################################################################################
# Devops toolkit installation
echo "----------------- Starting Devops toolkit installation...----------------- "
###############################################################################################
brew install tfenv starship pre-commit pyenv git tree wget commitizen
# Check command success
check_command_success
# Echo to user
echo "Installation of 'tfenv starship pre-commit pyenv git tree wget' was successful"
# Install latest version of Terraform
echo "----------------- Checking latest terraform version -----------------"

latest_terraform_version=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep "tag_name" | cut -d '"' -f 4 | awk -F 'v' '{print $2}')

echo "----------------- Installing latest stable release of Terraform: $latest_terraform_version-----------------"
tfenv use $latest_terraform_version
# Check command success
check_command_success
# Echo to user
echo "Terraform installation was successful"

###############################################################################################
# Starship
echo "----------------- Configuring Starship.toml----------------- "
###############################################################################################
# eval "$(starship init zsh)"
mkdir -p ~/.config && touch ~/.config/starship.toml
# Check command success
check_command_success
# Echo to user
echo "~/.config/starship.toml created successfully"

# Define the content to be added to starship
content="# Get editor completions based on the config schema
\"\$schema\" = 'https://starship.rs/config-schema.json'

# Inserts a blank line between shell prompts
add_newline = true

# Replace the '❯' symbol in the prompt with '➜'
[character] # The name of the module we are configuring is 'character'
success_symbol = '[➜](bold green)' # The 'success_symbol' segment is being set to '➜' with the color 'bold green'

# Disable the package module, hiding it from the prompt completely
[package]
disabled = true
"

# Append the content to the config.toml file
echo "$content" >> ~/.config/starship.toml
# Check command success
check_command_success
# Echo to user
echo "Starship configuration complete: ~/.config/starship.toml"
