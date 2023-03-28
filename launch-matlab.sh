#!/bin/bash
test="Hello World"
echo $test

message="$1("
echo $message

counter=$((0))
echo $counter
for var in "$@"
do
if [$counter -gt 0]
then
message="$message, $var"
echo "$var"
fi
((counter++))
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