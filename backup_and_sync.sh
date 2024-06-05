#!/bin/bash

# Set the path to your Bear Markdown Export project directory
PROJECT_DIR=~/Documents/projects/bear-notes-backup
SCRIPT_REPO=~/Documents/projects/Bear-Markdown-Export

# Change to the project directory
cd "$SCRIPT_REPO"

source venv/bin/activate

# Run the Python script to export and backup Bear notes
python3 bear_export_sync.py --out "$PROJECT_DIR/Bear" --backup "$PROJECT_DIR/Backup"

# Change to the directory containing the exported notes
cd "$PROJECT_DIR"

# Stage all changes
git add .

# Commit the changes with a timestamp
git commit -m "Automated backup $(date)"

# Push the changes to the GitHub repository
git push origin main