#!/bin/bash

# Copies the given lauchd config file (plist) an reloads it.

sudo cp $1 /Library/LaunchDaemons/

sudo launchctl unload /Library/LaunchDaemons/$1

sudo launchctl load /Library/LaunchDaemons/$1