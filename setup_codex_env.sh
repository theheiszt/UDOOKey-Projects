#!/bin/bash

set -e
trap 'echo "[ERROR] Setup failed. Aborting." >&2; exit 1' ERR

SUBMODULE_DIR="udoo-key-arduino"
SUBMODULE_URL="https://github.com/theheiszt/udoo-key-arduino.git"

green="\033[0;32m"
yellow="\033[1;33m"
reset="\033[0m"

echo -e "${green}[INFO] Starting Codex environment setup...${reset}"

# Check for Git
if ! command -v git &> /dev/null; then
    echo "[ERROR] Git is not installed. Please install Git first."
    exit 1
fi

# Check or add submodule
if [ -d "$SUBMODULE_DIR" ]; then
    echo -e "${yellow}[SKIP] '$SUBMODULE_DIR' already exists. Skipping clone.${reset}"
else
    echo "[INFO] '$SUBMODULE_DIR' not found. Adding as submodule..."
    git submodule add "$SUBMODULE_URL" "$SUBMODULE_DIR"
    git commit -am "Add $SUBMODULE_DIR as submodule"
fi

# Init/update submodules
echo "[INFO] Initializing and updating submodules..."
git submodule update --init --recursive

echo -e "${green}[DONE] Codex environment is ready.${reset}"
