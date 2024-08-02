#!/bin/bash

# ---------------------
# Sync Custom ZSH Aliases
# ---------------------

# Alias list
declare -a aliases=(
    # Node
    "alias nap='node app.js'"
    "alias tap='ts-node app.ts'"
    
    # NPM
    "alias ni='npm i'"
    "alias nil='npm i --legacy-peer-deps'"
    "alias nrn='if [ -d \"./node_modules\" ]; then rm -rf \"./node_modules\"; echo \"Removed ./node_modules directory\"; fi; if [ -f \"./package-lock.json\" ]; then rm \"./package-lock.json\"; echo \"Removed ./package-lock.json file\"; fi'"

    # PNPM
    "alias pi='pnpm i'"
    "alias piw='pnpm i --workspace-root'"
    "alias prn='if [ -d \"./node_modules\" ]; then rm -rf \"./node_modules\"; echo \"Removed ./node_modules directory\"; fi; if [ -f \"./pnpm-lock.yaml\" ]; then rm \"./pnpm-lock.yaml\"; echo \"Removed ./pnpm-lock.yaml file\"; fi'"

    # Composer
    "alias ci='composer install'"
)

# .zshrc file path
zshrc_file="$HOME/.zshrc"

# Backup the current .zshrc file
backup_file="$HOME/.zshrc.bak"
cp "$zshrc_file" "$backup_file"

# Create a temporary file for the new aliases
temp_file=$(mktemp)

# Append existing content of the .zshrc file to the temporary file
cat "$backup_file" > "$temp_file"

# Check if the region tags exist
if grep -q "#region dev aliases" "$zshrc_file"; then
    # Remove existing region content, but keep the region tags
    sed -i '' "/#region dev aliases/,/#endregion/d" "$temp_file"
fi

# Add the region start and end tags and aliases to the temporary file
echo "#region dev aliases" >> "$temp_file"

# Add aliases to the temporary file
for alias_cmd in "${aliases[@]}"
do
    echo "$alias_cmd" >> "$temp_file"
done

echo "#endregion" >> "$temp_file"

# Replace the old .zshrc file with the new content
mv "$temp_file" "$zshrc_file"

# Remove the backup file
rm "$backup_file"

# Source the .zshrc file to apply changes
source "$zshrc_file"

# Reload the terminal profile
exec zsh
