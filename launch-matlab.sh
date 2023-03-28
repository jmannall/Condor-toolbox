#!/bin/bash
test="Hello World"
echo $test

message="$1("
echo $message

for var in "$@"
do
message="$message, $var"
echo "$var"
done

message="$message)"
echo $message

exec /vol/hpc-software/software/matlab/R2022a/bin/matlab -batch \
"addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); \
addpath(genpath('Diffraction-toolbox')); \
addpath(genpath('Edge-diffraction-Matlab-toolbox')); \
$message;"