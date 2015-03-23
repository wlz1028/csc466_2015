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
mv out.txt out_1.2_N_1.txt
kill $pid1 $pid2
sleep 1

#git add out_1.1_N_1.txt  out_1.1_N_5.txt out_1.1_N_9.txt
#git commit -m 'a'
