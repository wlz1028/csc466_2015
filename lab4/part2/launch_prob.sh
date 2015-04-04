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

java Estimator/Estimator $1 $2 $3
kill $pid_bb
