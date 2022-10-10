#!/bin/sh

if hash xss-lock 2>/dev/null && hash i3lock 2>/dev/null; then
  xss-lock -- i3lock -c 000000
fi
