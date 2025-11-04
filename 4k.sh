#!/bin/bash
# Created By Kyser Clark - KyserClark.com / Modified by Albert LaScola

# Update ~/.xsessionrc with scaling configurations
echo "Updating ~/.xsessionrc for regular user..."
echo "export GDK_SCALE=2" >> ~/.xsessionrc
echo "export QT_SCALE_FACTOR=2" >> ~/.xsessionrc
echo "export XCURSOR_SIZE=48" >> ~/.xsessionrc
echo "~/.xsessionrc updated."

# Apply environment variables to current session
echo "Applying environment variables to current session..."
export GDK_SCALE=2
export QT_SCALE_FACTOR=2
export XCURSOR_SIZE=48

# Apply XFCE theme for HiDPI
echo "Setting XFCE theme to Kali-Dark-xHiDPI..."
xfconf-query -c xfwm4 -p /general/theme -s Kali-Dark-xHiDPI

# Set GDK Window Scaling Factor
echo "Setting GDK Window Scaling Factor..."
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -n -t 'int' -s 2

# Set XFCE cursor theme size
echo "Setting XFCE cursor size..."
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -n -t 'int' -s 48

# Set XFCE Terminal font size for HiDPI
echo "Setting XFCE Terminal font size..."
xfconf-query -c xfce4-terminal -p /font-name -s "Monospace 20"

# Set root's XFCE Terminal font size for HiDPI
echo "Setting root XFCE Terminal font size..."
sudo xfconf-query -c xfce4-terminal -p /font-name -s "Monospace 20"

# Add environment variables to sudoers file to fix small text in sudo applications
echo "Updating sudoers file to keep environment variables when using sudo..."
sudo sed -i '/Defaults\s*env_keep\s*\+=\s*"/s/\"$/ GDK_SCALE QT_SCALE_FACTOR XCURSOR_SIZE"/' /etc/sudoers
echo "Sudoers file updated."

# Update root's .zshrc for terminal scaling
echo "Updating /root/.zshrc for root terminal scaling..."
sudo bash -c 'echo "export GDK_SCALE=2" >> /root/.zshrc'
sudo bash -c 'echo "export QT_SCALE_FACTOR=2" >> /root/.zshrc'
sudo bash -c 'echo "export XCURSOR_SIZE=48" >> /root/.zshrc'
echo "/root/.zshrc updated."

# Restart window manager to apply changes immediately
echo "Restarting window manager to apply changes..."
xfwm4 --replace &
sleep 2

echo "All configurations applied and active! You may need to restart some applications for full effect."
echo "Note: Already running applications will need to be restarted to pick up the new scaling."
