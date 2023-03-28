#!/bin/bash
test="Hello World"
echo $test

counter=$((0))
echo $counter
number="$@"
echo $number

if [ $# -eq "0" ]
then
    echo No input arguments
elif [ $# -eq "1" ]
then
    message="$1"
elif [ $# -eq "2" ]
then
    message="$1($2)"
elif [ $# -eq "3" ]
then
    message="$1($2, $3)"
elif [ $# -eq "4" ]
then
    message="$1($2, $3, $4)"
elif [ $# -eq "5" ]
then
    message="$1($2, $3, $4, $5)"
elif [ $# -eq "6" ]
then
    message="$1($2, $3, $4, $5, $6)"
else
    echo More than five input arguments
fi

echo $message

echo Launch MATLAB
exec /vol/hpc-software/software/matlab/R2022a/bin/matlab -batch \
"addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); \
addpath(genpath('Diffraction-toolbox')); \
addpath(genpath('Edge-diffraction-Matlab-toolbox')); \
$message;"