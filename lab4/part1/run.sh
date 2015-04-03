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

java Estimator/Estimator 100 400 10
sleep 1

java Estimator/Estimator 100 400 100
sleep 1

java Estimator/Estimator 100 400 1000
kill $pid_bb
