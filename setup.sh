#!/bin/bash
set -e

# Avoid interactive prompts (like keyboard selection)
export DEBIAN_FRONTEND=noninteractive

# Update & install dependencies
apt-get update
apt-get install -y --no-install-recommends \
  xfce4 xfce4-goodies novnc websockify x11vnc xvfb dbus-x11 netsurf-gtk wget \
  locales tzdata

# Install RustDesk
wget -O /tmp/rustdesk.deb https://github.com/rustdesk/rustdesk/releases/download/1.4.1/rustdesk-1.4.1-x86_64.deb
dpkg -i /tmp/rustdesk.deb || apt-get -f install -y
rm /tmp/rustdesk.deb

# Make your desktop start script executable
chmod +x /workspaces/ub-ttest/start-desktop.sh

# Run the desktop
/workspaces/ub-ttest/start-desktop.sh
