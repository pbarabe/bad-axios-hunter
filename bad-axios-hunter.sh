#!/usr/bin/env bash
#
# Name:
#   bad-axios-hunter.sh
#
# About:
#   Recursively `grep` each package lock files in a directory for
#   plain-crypto-js and vulnerable versions of axios.
#
# Prerequites:
#   bash
#
# Usage:
#   shaihulud-hunter.sh <directory>
#
# Author:
#   Patrick Barabe <pbarabe@arizona.edu>
#
# Modification log:
#   20 Apr 2026 - Forked and adapted as bad-axios-hunter
#   24 Sep 2025 - Refine logic to evaluate only package-lock.json files
#   23 Sep 2025 - Initial creation (shai-hulud-hunter.sh)

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_name>"
    echo "       Search <directory_name>"
    echo ""
    echo "Usage: $0 -t"
    echo "       Scan test files in ./test/ dir"
    exit 1
fi

# Get location of this script
script_directory=$(dirname -- $(readlink -fn -- "$0"; echo x))

# Assign arguments to variables
search_directory="$1"

if [ "$1" == "-t" ]; then
  search_directory=$(dirname -- $(readlink -fn -- "$0"; echo x))
fi

# Create a temporary file to store the results
temp_file=$(mktemp)

# Find all package-lock.json files and search for package names
find "$search_directory" -name "package-lock.json" -o -name "yarn.lock" -o -name "pnpm-lock.yaml" | while read -r lock_file; do
    echo "Scanning $lock_file"
    if grep -E "axios@(1\.14\.1|0\.30\.4)|plain-crypto-js" "$lock_file"; then
        echo -e "\e[31mFound package\e[0m plain-crypto-js in $lock_file" >> "$temp_file"
    fi
done

# Display results
if [ -s "$temp_file" ]; then
    echo ""
    echo "Scan results:"
    cat "$temp_file"
    echo ""
else
    echo ""
    echo -e "\e[32mOK: \e[0mplain-crypto-js package not found in any package-lock.json, yarn.lock, or pnpm-lock.yaml files."
    echo ""
fi

# Clean up
rm "$temp_file"

