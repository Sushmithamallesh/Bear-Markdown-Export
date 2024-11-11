#!/bin/bash

# Set the paths to your Bear notes backup directory and Hugo blog directory
BEAR_NOTES_DIR=~/Documents/projects/bear-notes-backup/Bear
HUGO_BLOG_DIR=~/Documents/projects/sushispot

# Set the filename of the Markdown files you want to expose
MARKDOWN_FILE_ML="Notes on ML.md"
MARKDOWN_FILE_DISTRIBUTED_SYSTEM="Notes on Distributed Systems.md"
MARKDOWN_FILE_ORDINARY="Field Notes on the Ordinary.md"

ASSETS_DIR="BearImages"
HUGO_FILE_NAME_LLM=content/notes/runningnoteml.md
HUGO_FILE_NAME_DISTRIBUTED_SYSTEM=content/notes/runningnotedistributedsystems.md
HUGO_FILE_NAME_ORDINARY=content/notes/fieldnotesontheordinary.md

# Copy the Markdown files from Bear notes backup to Hugo blog content directory
cp "$BEAR_NOTES_DIR/$MARKDOWN_FILE_ML" "$HUGO_BLOG_DIR/$HUGO_FILE_NAME_LLM"
cp "$BEAR_NOTES_DIR/$MARKDOWN_FILE_DISTRIBUTED_SYSTEM" "$HUGO_BLOG_DIR/$HUGO_FILE_NAME_DISTRIBUTED_SYSTEM"
cp "$BEAR_NOTES_DIR/$MARKDOWN_FILE_ORDINARY" "$HUGO_BLOG_DIR/$HUGO_FILE_NAME_ORDINARY"

# Copy the BearImages directory recursively from Bear notes backup to Hugo blog directory
cp -r "$BEAR_NOTES_DIR/BearImages" "$HUGO_BLOG_DIR/static/"

# Change to the Hugo blog directory
cd "$HUGO_BLOG_DIR"

# Stage all changes
git add .

# Commit the changes with a timestamp
git commit -m "Automated running note export"

# Push the changes to the GitHub repository
git push origin main