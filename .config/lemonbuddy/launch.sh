#!/usr/bin/env sh

# Terminate already running bar instances
lemonbuddy_terminate noconfirm

# Launch bar1

lemonbuddy_wrapper bar1-border &
sleep 0.2
lemonbuddy_wrapper bar1 &
lemonbuddy_wrapper bar2-border &
sleep 0.2
lemonbuddy_wrapper bar2 &

echo "Bar launched..."
