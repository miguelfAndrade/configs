#!/bin/bash

PROFILE="$HOME/.profile"
LINE='eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh-themes/tokyonight_storm.omp.json)"'

set -e

curl -fsSL https://ohmyposh.dev/install.sh | bash -s
oh-my-posh font install meslo
mkdir ~/config/oh-my-posh-themes/
cp tokyonight_storm.omp.json  ~/.config/oh-my-posh-theme


if ! grep -Fxq "$LINE" "$PROFILE" 2>/dev/null; then
    printf '\n%s\n' "$LINE" >> "$PROFILE"
    echo "Oh My Posh configuration added to $PROFILE"
else
    echo "Oh My Posh configuration already exists in $PROFILE"
fi
