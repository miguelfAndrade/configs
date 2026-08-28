#!/bin/bash

PROFILE="$HOME/.profile"
LINE='eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh-themes/tokyonight_storm.omp.json)"'

if ! grep -Fxq "$LINE" "$PROFILE" 2>/dev/null; then
    printf '\n%s\n' "$LINE" >> "$PROFILE"
    echo "Oh My Posh configuration added to $PROFILE"
else
    echo "Oh My Posh configuration already exists in $PROFILE"
fi
