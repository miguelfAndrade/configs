#!/usr/bin/env bash

set -euo pipefail

PROFILE="$HOME/.bashrc"
THEME_DIR="$HOME/.config/oh-my-posh-themes"
THEME_FILE="tokyonight_storm.omp.json"
THEME_PATH="$THEME_DIR/$THEME_FILE"
LINE='eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh-themes/tokyonight_storm.omp.json)"'

echo "==> Installing Oh My Posh..."

curl -fsSL https://ohmyposh.dev/install.sh | bash -s

# Refresh the shell's command lookup cache
hash -r 2>/dev/null || true

# Verify Oh My Posh installation
if ! command -v oh-my-posh >/dev/null 2>&1; then
    echo "ERROR: Oh My Posh was not found after installation."
    echo "Make sure the installation directory is included in PATH."
    exit 1
fi

echo "==> Oh My Posh installed successfully:"
oh-my-posh version

# Install fonts
echo "==> Installing Meslo fonts..."
oh-my-posh font install meslo

# Create theme directory
echo "==> Creating theme directory..."
mkdir -p "$THEME_DIR"

# Copy theme
echo "==> Installing theme..."
if [[ ! -f "$THEME_FILE" ]]; then
    echo "ERROR: Theme file '$THEME_FILE' was not found."
    exit 1
fi

cp "$THEME_FILE" "$THEME_PATH"

# Verify theme installation
if [[ ! -f "$THEME_PATH" ]]; then
    echo "ERROR: Failed to copy theme to '$THEME_PATH'."
    exit 1
fi

echo "==> Theme installed successfully: $THEME_PATH"

# Add Oh My Posh configuration to .bashrc
if ! grep -Fxq "$LINE" "$PROFILE" 2>/dev/null; then
    printf '\n# Oh My Posh Theme config\n%s\n' "$LINE" >> "$PROFILE"
    echo "==> Oh My Posh configuration added to $PROFILE"
else
    echo "==> Oh My Posh configuration already exists in $PROFILE"
fi

echo
echo "Installation completed successfully!"
echo "Run the following to apply the configuration:"
echo "  source $PROFILE"
