#!/bin/bash
sh ./git-clone.sh
sh ./launch-matlab.sh FieldAroundWedge $1
sh ./rm-folders.sh