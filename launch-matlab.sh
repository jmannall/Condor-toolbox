#!/bin/bash
exec /vol/hpc-software/software/matlab/R2022a/bin/matlab -nodisplay -nosplash -batch \
"addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); \
addpath(genpath('Diffraction-toolbox')); \
addpath(genpath('Edge-diffraction-Matlab-toolbox')); \
z = dlarray($1 + $2i); \
r = real(z); \
im = imag(z); \
disp(['Complex: ' num2str(z)]); \
disp(['Real: ' num2str(r)]); \
disp(['Imaginary: ' num2str(im)]);"