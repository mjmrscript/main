#!/bin/bash
# AliBigdeli - thealibigdeli.ir
# Ubuntu Mirror Configuration Tool
# Optimizes package downloads with local Iranian mirrors
echo -e "Created by AliBigdeli - thealibigdeli.ir v.2 \n"
# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" >&2
    exit 1
fi
# Check for lsb_release
if ! command -v lsb_release &> /dev/null; then
    echo "lsb_release could not be found. Please install lsb-release package." >&2
    exit 1
fi
# Get Ubuntu codename
UBUNTU_CODENAME=$(lsb_release -cs)

# ======================
# MIRROR CONFIGURATION FUNCTIONS
# ======================
# Each mirror has its own configuration function
# Returns the exact configuration lines needed for that mirror
# Format: mirror_<key>() { ... }

mirror_arvan() {
    echo "Types: deb"
    echo "URIs: http://mirror.arvancloud.ir/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_chabokan() {
    echo "Types: deb"
    echo "URIs: https://mirror2.chabokan.net/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main universe"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
    echo "Options: trusted=yes"
}

mirror_runflare() {
    echo "Types: deb"
    echo "URIs: https://mirror-linux.runflare.com/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_sindad() {
    echo "Types: deb"
    echo "URIs: https://ir.ubuntu.sindad.cloud/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_hyperclouds() {
    echo "Types: deb"
    echo "URIs: https://ubuntu.hyperclouds.ir/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-backports $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_shatel() {
    echo "Types: deb"
    echo "URIs: http://mirror.shatel.ir/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_rasanegar() {
    echo "Types: deb"
    echo "URIs: http://mirror.rasanegar.com/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_pardisco() {
    echo "Types: deb"
    echo "URIs: https://mirrors.pardisco.co/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_mobinhost() {
    echo "Types: deb"
    echo "URIs: https://mirror.mobinhost.com/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_irarchive() {
    echo "Types: deb"
    echo "URIs: https://ir.archive.ubuntu.com/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_liara() {
    # Liara mirror has two separate blocks as requested
    echo "Types: deb"
    echo "URIs: https://linux-mirror.liara.ir/repository/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-backports"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
    echo
    echo "Types: deb"
    echo "URIs: https://linux-mirror.liara.ir/repository/ubuntu-security"
    echo "Suites: $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

mirror_default() {
    echo "Types: deb"
    echo "URIs: http://archive.ubuntu.com/ubuntu"
    echo "Suites: $UBUNTU_CODENAME $UBUNTU_CODENAME-updates $UBUNTU_CODENAME-security"
    echo "Components: main restricted universe multiverse"
    echo "Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg"
}

# ======================
# MIRROR SELECTION MENU
# ======================
declare -a keys=(
    "arvan"
    "chabokan"
    "runflare"
    "sindad"
    "hyperclouds"
    "shatel"
    "rasanegar"
    "pardisco"
    "mobinhost"
    "irarchive"
    "liara"
    "clear"
    "restore_default"
)

declare -a display_names=(
    "Arvan (Recommended)"
    "Chabokan"
    "Runflare (Most Updated)"
    "Sindad (Recommended)"
    "Hyper Clouds (Recommended)"
    "Shatel (Not Working)"
    "Rasanegar (Not Working)"
    "Pardisco"
    "Mobinhost"
    "irarchive"
    "Liara"
    "Clear all mirrors"
    "Restore default Ubuntu"
)

# Display menu
echo "Available mirrors:"
for i in "${!display_names[@]}"; do
    echo "$((i+1)). ${display_names[$i]}"
done

# Get user selection
read -p "Select a mirror (1-13): " choice

# Validate selection
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt 13 ]; then
    echo "Invalid selection. Please enter a number between 1 and 13." >&2
    exit 1
fi

# Get selected mirror key
index=$((choice-1))
selected_key=${keys[$index]}

# Function to clear all mirror configurations
clear_mirror_configs() {
    echo "Clearing existing mirror configurations..."
    # Remove all sources.list.d files
    rm -f /etc/apt/sources.list.d/*
    # Create a blank sources.list
    > /etc/apt/sources.list
}

# Handle special options
if [ "$selected_key" = "clear" ]; then
    clear_mirror_configs
    echo -e "\nAll mirror configurations cleared."
    echo "Blank sources.list created."
    echo "Run 'apt update' to refresh package lists"
    exit 0
fi

if [ "$selected_key" = "restore_default" ]; then
    clear_mirror_configs
    # Set the default mirror
    mirror_default > "/etc/apt/sources.list.d/ubuntu-default.sources"
    echo -e "\nDefault mirror configuration set."
    echo "New mirror: Ubuntu Default (default)"
    echo "Run 'apt update' to refresh package lists"
    exit 0
fi

# For regular mirror selections, clear first then set the new mirror
clear_mirror_configs

# Generate new configuration using mirror-specific logic
# Create a temporary file for the new configuration
TMP_FILE=$(mktemp)
mirror_${selected_key} > "$TMP_FILE"

# Create the sources.list.d file
MIRROR_NAME="ubuntu-${selected_key}"
echo "Generating $MIRROR_NAME.sources..."
cat > "/etc/apt/sources.list.d/$MIRROR_NAME.sources" <<EOF
# Generated by AliBigdeli - thealibigdeli.ir on $(date)
$(cat "$TMP_FILE")
EOF

# Clean up
rm -f "$TMP_FILE"

# Verify the new configuration
echo -e "\nNew configuration:"
cat "/etc/apt/sources.list.d/$MIRROR_NAME.sources" | grep -v '^#' | head -n 10

echo -e "\nSources.list.d configuration updated successfully!"
echo "New mirror: ${display_names[$index]} ($selected_key)"
echo "Run 'apt update' to refresh package lists"