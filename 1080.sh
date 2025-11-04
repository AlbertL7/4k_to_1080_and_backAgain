#!/bin/bash
# Created By Kyser Clark - KyserClark.com / Modified by Albert LaScola
# Revert HiDPI scaling back to normal 1920x1080 settings

# Remove scaling configurations from ~/.xsessionrc
echo "Removing HiDPI configurations from ~/.xsessionrc..."
sed -i '/export GDK_SCALE=2/d' ~/.xsessionrc
sed -i '/export QT_SCALE_FACTOR=2/d' ~/.xsessionrc
sed -i '/export XCURSOR_SIZE=48/d' ~/.xsessionrc
sed -i '/export XCURSOR_SIZE=36/d' ~/.xsessionrc
echo "~/.xsessionrc cleaned."

# Remove environment variables from current session
echo "Removing environment variables from current session..."
unset GDK_SCALE
unset QT_SCALE_FACTOR
export XCURSOR_SIZE=24

# Apply regular XFCE theme
echo "Setting XFCE theme to Kali-Dark..."
xfconf-query -c xfwm4 -p /general/theme -s Kali-Dark

# Set GDK Window Scaling Factor back to 1
echo "Setting GDK Window Scaling Factor to 1..."
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 1

# Set XFCE cursor theme size back to normal
echo "Setting XFCE cursor size to 24..."
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s 24

# Set XFCE Terminal font size back to normal
echo "Setting XFCE Terminal font size to normal..."
xfconf-query -c xfce4-terminal -p /font-name -s "Monospace 12"

# Set root's XFCE Terminal font size back to normal
echo "Setting root XFCE Terminal font size to normal..."
sudo xfconf-query -c xfce4-terminal -p /font-name -s "Monospace 12"

# Remove environment variables from sudoers file
echo "Removing HiDPI environment variables from sudoers file..."
sudo sed -i 's/ GDK_SCALE QT_SCALE_FACTOR XCURSOR_SIZE//g' /etc/sudoers
echo "Sudoers file updated."

# Remove scaling from root's .zshrc
echo "Removing HiDPI configurations from /root/.zshrc..."
sudo sed -i '/export GDK_SCALE=2/d' /root/.zshrc
sudo sed -i '/export QT_SCALE_FACTOR=2/d' /root/.zshrc
sudo sed -i '/export XCURSOR_SIZE=48/d' /root/.zshrc
sudo sed -i '/export XCURSOR_SIZE=36/d' /root/.zshrc
echo "/root/.zshrc cleaned."

# Restart window manager to apply changes immediately
echo "Restarting window manager to apply changes..."
xfwm4 --replace &
sleep 2

echo "All HiDPI configurations removed and reverted! You may need to restart some applications for full effect."
echo "Note: Already running applications will need to be restarted to pick up the new scaling."
