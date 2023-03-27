#!/bin/bash
exec /vol/hpc-software/software/matlab/R2022a/bin/matlab -nodisplay -nosplash -r \
"addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); \
addpath(genpath('Diffraction-toolbox')); \
addpath(genpath('Edge-diffraction-Matlab-toolbox'));" \