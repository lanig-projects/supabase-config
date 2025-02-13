#!/bin/bash

echo "WARNING: This will remove all containers and container data, and will reset the .env file. This action cannot be undone!"
read -p "Are you sure you want to proceed? (y/N) " -n 1 -r
echo    # Move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Operation cancelled."
    exit 1
fi

echo "Cleaning up bind-mounted directories..."
BIND_MOUNTS=(
  "./volumes/db/data"
)

for DIR in "${BIND_MOUNTS[@]}"; do
  if [ -d "$DIR" ]; then
    echo "Deleting $DIR..."
    rm -rf "$DIR"
  else
    echo "Directory $DIR does not exist. Skipping bind mount deletion step..."
  fi
done

echo "Cleanup complete!"