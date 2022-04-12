#!/bin/bash
if [ -f /webapp/app.pid ]; then
    PID=$(cat /webapp/app.pid)
    if [ -d /proc/$PID ]; then
        kill -15 $PID
    fi
fi