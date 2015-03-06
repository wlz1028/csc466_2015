#!/bin/bash

make
sleep 0.5
cd ..
java TokenBucket/TokenBucket &
PID1=$!
sleep 0.5
cd TokenBucket
java TrafficSink &
PID2=$!
sleep 0.5
java TrafficGenerator
sleep 1
kill $PID1 $PID2
cp out.txt out3.txt
cp ../bucket.txt ../bucket3.txt
git add out3.txt ../bucket3.txt
