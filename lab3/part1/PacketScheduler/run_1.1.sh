#!/bin/bash

make

echo "N=1"
java TrafficSink &
pid1=$!
java TrafficGenerator_impr 1
sleep 2
mv out.txt out_1.1_N_1.txt
kill $pid1
sleep 1

echo "N=5"
java TrafficSink &
pid1=$!
java TrafficGenerator_impr 5
sleep 2
mv out.txt out_1.1_N_5.txt
kill $pid1
sleep 1

echo "N=9"
java TrafficSink &
pid1=$!
java TrafficGenerator_impr 10
sleep 2
mv out.txt out_1.1_N_9.txt
kill $pid1
sleep 1

git add out_1.1_N_1.txt  out_1.1_N_5.txt out_1.1_N_9.txt
#git commit -m 'a'
