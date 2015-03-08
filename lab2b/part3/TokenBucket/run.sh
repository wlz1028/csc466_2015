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
java TrafficGenerator_video
echo "finish sending"
sleep 10
kill $PID1 $PID2
cp out.txt out2.txt
cp ../bucket.txt ../bucket2.txt
git add out2.txt ../bucket2.txt
