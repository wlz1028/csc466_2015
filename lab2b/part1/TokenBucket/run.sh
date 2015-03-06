#!/bin/bash

make
java TrafficSink &
PID=$!
java TrafficGenerator
kill $PID
