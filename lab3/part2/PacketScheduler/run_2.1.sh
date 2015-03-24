#!/bin/bash

make

echo "N=1"
java TrafficSink &
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
cd -
pid2=$!
java TrafficGenerator_impr 1
cp out.txt out_1.3_N_1.txt
cp ../discard_PacketScheduler.txt ../PacketScheduler_discard_1.3_N_1.txt
cp ../PacketScheduler.txt ../PacketScheduler_1.3_N_1.txt
kill $pid1 $pid2
sleep 1

echo "N=5"
java TrafficSink &
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
cd -
pid2=$!
java TrafficGenerator_impr 5
cp out.txt out_1.3_N_5.txt
cp ../discard_PacketScheduler.txt ../PacketScheduler_discard_1.3_N_5.txt
cp ../PacketScheduler.txt ../PacketScheduler_1.3_N_5.txt
kill $pid1 $pid2
sleep 1

echo "N=9"
java TrafficSink &
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
cd -
pid2=$!
java TrafficGenerator_impr 9
cp out.txt out_1.3_N_9.txt
cp ../discard_PacketScheduler.txt ../PacketScheduler_discard_1.3_N_9.txt
cp ../PacketScheduler.txt ../PacketScheduler_1.3_N_9.txt
kill $pid1 $pid2
sleep 1

git add *txt
git add ../*txt
echo 'git commit -m "a"'
