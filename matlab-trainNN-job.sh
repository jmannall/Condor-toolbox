#!/bin/bash
if [ $3 -eq "0" ]
then
learnRate=$((1000))
elif [ $3 -eq "1" ]
learnRate=$((10000))
else
learnRate=$((1000))
echo Learn rate set to default
fi
sh ./git-clone.sh
sh ./launch-matlab.sh TrainNeuralNetwork $1 $2 $3 "'$4'"
sh ./rm-folders.sh