#!/bin/bash

make

java TrafficSink &
N=1
echo "N="$N
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
cd -
pid2=$!
java TrafficGenerator_impr $N &
pid3=$!
java TrafficGenerator_video &
pid4=$!
echo "Sending..."
wait $pid3 $pid4
echo "Finish..."
cp out.txt out_2.3_N_"$N".txt
cp ../discard_PacketScheduler.txt ../PacketScheduler_discard_2.3_N_"$N".txt
cp ../PacketScheduler.txt ../PacketScheduler_2.3_N_"$N".txt
kill $pid1 $pid2
sleep 1
echo ""
echo ""
echo ""

java TrafficSink &
N=5
echo "N="$N
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
cd -
pid2=$!
java TrafficGenerator_impr $N &
pid3=$!
java TrafficGenerator_video &
pid4=$!
echo "Sending..."
wait $pid3 $pid4
echo "Finish..."
cp out.txt out_2.3_N_"$N".txt
cp ../discard_PacketScheduler.txt ../PacketScheduler_discard_2.3_N_"$N".txt
cp ../PacketScheduler.txt ../PacketScheduler_2.3_N_"$N".txt
kill $pid1 $pid2
sleep 1
echo ""
echo ""
echo ""

java TrafficSink &
N=9
echo "N="$N
pid1=$!
cd ..
java PacketScheduler/PacketScheduler &
cd -
pid2=$!
java TrafficGenerator_impr $N &
pid3=$!
java TrafficGenerator_video &
pid4=$!
echo "Sending..."
wait $pid3 $pid4
echo "Finish..."
cp out.txt out_2.3_N_"$N".txt
cp ../discard_PacketScheduler.txt ../PacketScheduler_discard_2.3_N_"$N".txt
cp ../PacketScheduler.txt ../PacketScheduler_2.3_N_"$N".txt
kill $pid1 $pid2
sleep 1
echo ""
echo ""
echo ""
