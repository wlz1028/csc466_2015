#!/bin/bash

make

java TrafficSink &
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
cd -
pid2=$!

java TrafficGenerator_impr 8 &
pid3=$!
java TrafficGenerator_impr 6 &
pid4=$!
java TrafficGenerator_impr 2 &
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

