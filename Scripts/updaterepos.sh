#!/bin/bash
# Script to fetch the installed packages in the system
yum list installed | gawk --file ~/gawk_scripts/yumreposcript > ~/Documents/dotfiles/currpacks
echo Done!
