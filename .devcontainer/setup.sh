#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo "[1/5] Updating package list..."
apt-get update -y

echo "[2/5] Installing XFCE + tools..."
apt-get install -y xfce4 xfce4-goodies novnc websockify x11vnc xvfb dbus-x11 netsurf-gtk wget

echo "[3/5] Downloading RustDesk 1.4.1..."
wget -O /tmp/rustdesk.deb https://github.com/rustdesk/rustdesk/releases/download/1.4.1/rustdesk-1.4.1-x86_64.deb

echo "[4/5] Installing RustDesk..."
dpkg -i /tmp/rustdesk.deb || apt-get -f install -y
rm /tmp/rustdesk.deb

echo "[5/5] Making start-desktop.sh executable..."
chmod +x ./start-desktop.sh

echo "✅ Setup complete. Run ./start-desktop.sh to start your Linux desktop!"
