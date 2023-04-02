#!/bin/bash]
sh ./git-clone.sh
#if [ $1 -eq "0" ]
#then
#idx=$((397))
#sh ./launch-matlab.sh GenerateNNData $idx $2
#elif [ $1 -eq "1" ]
#then
#idx=$((486))
#sh ./launch-matlab.sh GenerateNNData $idx $2
#else
#sh ./launch-matlab.sh GenerateNNDataSingle $1 $2
#fi
idx=$((397))
sh ./launch-matlab.sh GenerateNNData $idx $2
sh ./rm-folders.sh