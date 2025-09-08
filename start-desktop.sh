#!/bin/bash
# Kill any old Xvfb/x11vnc
pkill Xvfb
pkill x11vnc

# Start Xvfb at 1280x820
Xvfb :99 -screen 0 1280x820x16 &
export DISPLAY=:99

# Start dbus
dbus-launch &

# Start XFCE desktop
xfce4-session &

# Start VNC server
x11vnc -display :99 -forever -nopw -rfbport 5900 &

# Start RustDesk (adjust version/path if needed)
rustdesk &
