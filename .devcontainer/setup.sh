#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo "[1/6] Updating package list..."
apt-get update -y

echo "[2/6] Installing XFCE + tools..."
apt-get install -y xfce4 xfce4-goodies novnc websockify x11vnc xvfb dbus-x11 netsurf-gtk wget

echo "[3/6] Downloading RustDesk 1.4.1..."
wget -O /tmp/rustdesk.deb https://github.com/rustdesk/rustdesk/releases/download/1.4.1/rustdesk-1.4.1-x86_64.deb

echo "[4/6] Installing RustDesk..."
dpkg -i /tmp/rustdesk.deb || apt-get -f install -y
rm /tmp/rustdesk.deb

echo "[5/6] Making start-desktop.sh executable..."
chmod +x ./start-desktop.sh

echo "[6/6] Starting Linux desktop..."
./start-desktop.sh &

echo "✅ Desktop is starting... Open port 6080 in your Codespace to view it!"
