#!/bin/bash
test="Hello World"
echo $test

message="$1("
echo $message

ARGS_COUNT=0

for x in $*
do ARGS_COUNT=$((ARGS_COUNT+1))  
echo $ARGS_COUNT

for $x in $ARGS_COUNT
do message="message$x,"

message="$message)"
echo $message

exec /vol/hpc-software/software/matlab/R2022a/bin/matlab -batch \
"addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); \
addpath(genpath('Diffraction-toolbox')); \
addpath(genpath('Edge-diffraction-Matlab-toolbox')); \
$message;"