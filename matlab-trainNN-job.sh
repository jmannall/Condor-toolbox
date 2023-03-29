#!/bin/bash
sh ./git-clone.sh
sh ./launch-matlab.sh TrainNeuralNetwork $1 $2 $3 "'$4'"
sh ./rm-folders.sh