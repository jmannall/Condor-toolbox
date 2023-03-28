#!/bin/bash
test="Hello World"
echo $test

message="$1("
echo $message

counter=$((0))
echo $counter
number="$@"
echo $number
test=$number[1:$#]
echo $test

ARGS=1
if [ $# -eq "$ARGS" ]
then
echo no arguments
else
echo loop through arguments
fi

for value in {1..2}
do
message="$message, $number[$value]"
echo $value
counter=$((counter+1))
echo $counter
done

message="$message)"
echo $message

echo Launch MATLAB
exec /vol/hpc-software/software/matlab/R2022a/bin/matlab -batch \
"addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); \
addpath(genpath('Diffraction-toolbox')); \
addpath(genpath('Edge-diffraction-Matlab-toolbox')); \
$message;"