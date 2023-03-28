#!/bin/bash
test="Hello World"
echo $test

counter=$((0))
echo $counter
number="$@"
echo $number

ARGS=1
if [ $# -eq "$ARGS" ]
then
echo No arguments
message="$1"
else
echo Loop through arguments
message="$1($2"
for value in {2..$#}
do
message="$message, $value"
done
message="$message)"
fi

echo $message

echo Launch MATLAB
exec /vol/hpc-software/software/matlab/R2022a/bin/matlab -batch \
"addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); \
addpath(genpath('Diffraction-toolbox')); \
addpath(genpath('Edge-diffraction-Matlab-toolbox')); \
$message;"