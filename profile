export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=river
export LIBSEAT_BACKEND=seatd

# Setup XDG_RUNTIME_DIR
if [ -z "$XDG_RUNTIME_DIR" ]; then
  XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"

  mkdir -pm 0700 "$XDG_RUNTIME_DIR"
  export XDG_RUNTIME_DIR
fi

# Start River
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec dbus-run-session river > ~/.river.log 2>&1
fi
