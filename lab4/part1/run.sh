#!/bin/bash

cd Estimator
make
cd -

cd BlackBox
make
cd -

java Estimator/Estimator 100 400 10
