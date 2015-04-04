#!/bin/bash

cd Estimator
make
cd -

cd BlackBox
make
cd -

java BlackBox/BlackBox 4444 &
pid_bb=$!
sleep 1
java Estimator/Estimator 100 400 $1
sleep 1
kill $pid_bb
