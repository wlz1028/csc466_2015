#!/bin/bash

make
cd ..
java Estimator/Estimator 100 400 10
cd -
