#!/bin/bash

make

java TrafficSink &
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
cd -
pid2=$!

java TrafficGenerator_impr 1 &
pid3=$!
java TrafficGenerator_impr 5 &
pid4=$!
java TrafficGenerator_impr 9 &
pid5=$!

echo "Sending..."
wait $pid3 $pid4 $pid5
echo "Finish..."
#cp out.txt out_2.3_N_"$N".txt
#cp ../discard_PacketScheduler.txt ../PacketScheduler_discard_2.3_N_"$N".txt
#cp ../PacketScheduler.txt ../PacketScheduler_2.3_N_"$N".txt
kill $pid1 $pid2
sleep 1
echo ""
echo ""
echo ""

