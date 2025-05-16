#!/bin/bash

# Configuration
TARGET_DIR="/path"
OWNER_USER="USER"
OWNER_GROUP="GROUP"

echo "Applying ownership to existing content..."
sudo chown -R $OWNER_USER:$OWNER_GROUP "$TARGET_DIR"

echo "Setting setgid bit to maintain group inheritance..."
sudo chmod g+s "$TARGET_DIR"

echo "Setting default ACLs for future files and directories..."
sudo setfacl -d -m u::rwx "$TARGET_DIR"
sudo setfacl -d -m g::rwx "$TARGET_DIR"
sudo setfacl -d -m o::rx  "$TARGET_DIR"

echo "Setting ACLs for existing files and directories..."
sudo setfacl -R -m u::rwx "$TARGET_DIR"
sudo setfacl -R -m g::rwx "$TARGET_DIR"
sudo setfacl -R -m o::rx  "$TARGET_DIR"

echo "✅ Permissions and ACLs have been applied successfully to $TARGET_DIR"
