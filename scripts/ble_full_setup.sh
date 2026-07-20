#!/bin/bash

# ============================================
# Script: setup_ble.sh
# Description: Full installation and configuration of ble.sh
# ============================================

set -e  # exit on error

echo "============================================"
echo "Starting ble.sh installation and setup..."
echo "============================================"

# 1. Install prerequisites
echo "Installing prerequisites (git, make, gawk)..."
sudo apt update
sudo apt install -y git make gawk

# 2. Clone and install ble.sh
echo "Cloning ble.sh repository..."
if [ -d "ble.sh" ]; then
    echo "ble.sh directory already exists. Removing old version..."
    rm -rf ble.sh
fi

git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
echo "Installing ble.sh..."
make -C ble.sh install PREFIX=~/.local

# 3. Add source line to .bashrc if not already present
if ! grep -q "source ~/.local/share/blesh/ble.sh" ~/.bashrc; then
    echo "Adding ble.sh to .bashrc..."
    echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
else
    echo "ble.sh already in .bashrc. Skipping..."
fi

# 4. Create or overwrite .blerc with custom settings
echo "Creating/overwriting ~/.blerc with custom settings..."
cat > ~/.blerc << 'EOF'
# ============================================
# Performance Optimizations
# ============================================
bleopt highlight_syntax=1
bleopt highlight_filename=1
bleopt highlight_variable=1
bleopt complete_auto_delay=0

# ============================================
# Visual Settings (Minimal & Clean)
# ============================================
ble-face auto_complete='fg=245'

ble-face syntax_command='fg=blue'
ble-face syntax_quoted='fg=green'
ble-face syntax_varname='fg=yellow'
ble-face syntax_comment='fg=244'
ble-face syntax_error='fg=red,bold'
ble-face command_builtin='fg=green'
ble-face command_keyword='fg=blue'
ble-face syntax_quoted='fg=blue'
ble-face command_file='fg=green'

ble-face filename_directory='fg=blue'
ble-face filename_executable='fg=green'
ble-face filename_link='fg=cyan'

# ============================================
# Prompt & Status Cleanup
# ============================================
bleopt prompt_eol_mark=''
bleopt exec_errexit_mark=
bleopt exec_exit_mark=

# ============================================
# Key Bindings (Smart History Search)
# ============================================
# Uncomment the following lines to enable:
# ble-bind -f 'C-r' history-search-backward
# ble-bind -f 'C-s' history-search-forward
EOF

echo "~/.blerc has been created/overwritten."

# 5. Source .bashrc to apply changes
echo "Applying changes..."
source ~/.bashrc

echo "============================================"
echo "Installation and configuration completed!"
echo "Please restart your terminal or run 'source ~/.bashrc' to see the changes."
echo "============================================"
