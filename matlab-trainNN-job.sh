#!/bin/bash
sh ./git-clone.sh
if [ $3 -eq "0" ]
then
learnRate=$((0.001))
elif [ $3 -eq "1" ]
then
learnRate=$((0.0001))
elif [ $3 -eq "2" ]
then
learnRate=$((0.00001))
fi
sh ./launch-matlab.sh TrainNeuralNetwork $1 $2 $learnRate "'$4'"
sh ./rm-folders.sh