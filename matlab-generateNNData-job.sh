#!/bin/bash
sh ./git-clone.sh
sh ./launch-matlab.sh 'GenerateNNData($1, $2)'
sh ./rm-folders.sh