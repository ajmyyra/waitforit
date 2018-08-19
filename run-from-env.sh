#!/usr/bin/env bash

# This script runs wait-for-it.sh with options defined in environment variables.

if [ -z $HOST ]; then
    echo "Host variable not set, exiting."
    exit 1
fi

if [ -z $PORT ]; then
    echo "Port variable not set, exiting."
    exit 1
fi

if [ -z $TIMEOUT ]; then
    echo "Timeout variable not set, setting to 120s."
    TIMEOUT=120
fi

./wait-for-it.sh --host=$HOST --port=$PORT --timeout=$TIMEOUT
exit $?
