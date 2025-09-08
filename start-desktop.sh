#!/bin/bash
set -e

# Kill any old sessions
killall Xvfb xfce4-session x11vnc websockify 2>/dev/null || true

# Start a new virtual display
Xvfb :99 -screen 0 1280x800x16 &
export DISPLAY=:99
sleep 2

# Start XFCE desktop
dbus-launch --exit-with-session xfce4-session &

# Start VNC server on port 5900
x11vnc -display :99 -forever -nopw -rfbport 5900 &

# Start noVNC on port 6080
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

# --- Apps auto-start ---
# Start NetSurf browser
netsurf-gtk https://duckduckgo.com &

# Start RustDesk (if installed)
if command -v rustdesk >/dev/null 2>&1; then
    rustdesk &
fi

wait -n
