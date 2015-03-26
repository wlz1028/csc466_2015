#!/bin/bash

make

Ns="1 5 9"

for N in $Ns
do
echo "N="$N
java TrafficSink &
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
pid2=$!
cd -
#java TrafficGenerator_impr $N &
pid3=$!
java TrafficGenerator_video &
pid4=$!
echo "Sending..."
wait $pid4
echo "Finish..."
cp out.txt out_2.3_N_"$N".txt
cp ../discard_PacketScheduler.txt ../PacketScheduler_discard_2.3_N_"$N".txt
cp ../PacketScheduler.txt ../PacketScheduler_2.3_N_"$N".txt
kill $pid1 $pid2 $pid3
sleep 1
echo ""
echo ""
echo ""
done
