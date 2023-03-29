#!/bin/bash
sh ./git-clone.sh
a = $(($3 * 10 ^ (-4))
sh ./launch-matlab.sh TrainNeuralNetwork $1 $2 $a $4
sh ./rm-folders.sh