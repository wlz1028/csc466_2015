#!/bin/bash

cd ..
java TokenBucket/TokenBucket &
PID1=$!
cd TokenBucket
java TrafficSink &
PID2=$!
java TrafficGenerator
sleep 1
kill $PID1 $PID2
