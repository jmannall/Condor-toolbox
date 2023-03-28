#!/bin/bash
set message = $1'('
echo "test"
echo %message%

set /A ARGS_COUNT = 0

for %x in (%*) do set /A ARGS_COUNT += 1    
echo %ARGS_COUNT%

for %x in (2, 1, ARGS_COUNT) do set message = message %1,

set message = message')'
echo %message%

exec /vol/hpc-software/software/matlab/R2022a/bin/matlab -batch \
"addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); \
addpath(genpath('Diffraction-toolbox')); \
addpath(genpath('Edge-diffraction-Matlab-toolbox')); \
message;"