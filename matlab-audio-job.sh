#!/bin/bash
sh ./git-clone.sh
sh ./launch-matlab.sh GenerateAudio($1, $2 + 1)
sh ./rm-folders.sh