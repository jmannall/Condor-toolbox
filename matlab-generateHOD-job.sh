#!/bin/bash
sh ./git-clone.sh
sh ./launch-matlab.sh GenerateHOD $1
sh ./rm-folders.sh