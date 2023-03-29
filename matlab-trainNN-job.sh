#!/bin/bash
sh ./git-clone.sh
#a = $(($3 * 1 / 10**4))
sh ./launch-matlab.sh TrainNeuralNetwork $1 $2 $3 $4
sh ./rm-folders.sh