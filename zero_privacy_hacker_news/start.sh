#! /usr/bin/env bash

set -e

PID_FILE="tmp/pids/$HOSTNAME.pid"

if [ -e $PID_FILE ]; then
    echo "Killing old server"
    kill -9 $(cat $PID_FILE)
fi

rails server -p 80 -b '0.0.0.0' -e production -P $PID_FILE
