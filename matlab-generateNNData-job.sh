#!/bin/bash
if [ $1 -eq "0" ]
then
num=$((28))
elif [ $1 -eq "1" ]
then
num=$((37))
fi
sh ./git-clone.sh
sh ./launch-matlab.sh GenerateNNData $num $2
sh ./rm-folders.sh