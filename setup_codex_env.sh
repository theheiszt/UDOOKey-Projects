#!/bin/bash

# Codex setup script for UDOOKey-Projects
# Adds udoo-key-arduino as a submodule if not already present

SUBMODULE_DIR="udoo-key-arduino"
SUBMODULE_URL="https://github.com/theheiszt/udoo-key-arduino.git"

echo "[INFO] Setting up Codex environment..."

if [ -d "$SUBMODULE_DIR" ]; then
    echo "[OK] '$SUBMODULE_DIR' already exists. Skipping clone."
else
    echo "[INFO] '$SUBMODULE_DIR' not found. Cloning as submodule..."
    git submodule add "$SUBMODULE_URL" "$SUBMODULE_DIR"
    echo "[INFO] Submodule added. Committing changes..."
    git commit -am "Add udoo-key-arduino as a submodule"
fi

echo "[DONE] Codex environment is ready."
