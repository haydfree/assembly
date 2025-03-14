#!/bin/bash

PROJECT_DIR="."

cd "$PROJECT_DIR" || { echo "Project directory not found!"; exit 1; }

handle_changes() {
    echo "Changes detected. Committing and restarting services..."
    git add .
    git commit -m "Auto commit: $(date)"
    git push origin main
}

export -f handle_changes

inotifywait -m -r -e modify,create,delete --exclude '(^|/)(\.git|node_modules|build|dist)(/|$)' "$PROJECT_DIR" |
while read -r directory events filename; do
    handle_changes
done

