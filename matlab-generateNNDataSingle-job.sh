#!/bin/bash
sh ./git-clone.sh
sh ./launch-matlab-21a.sh GenerateNNDataSingle $1 $2
sh ./rm-folders.sh