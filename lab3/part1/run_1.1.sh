#!/bin/bash

make
java TrafficSink &
pid1=$!

java TrafficGenerator_impr 1
sleep 2

kill $pid1

