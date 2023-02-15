#!/bin/bash
git clone https://github.com/jmannall/Diffraction-toolbox.git
git clone https://github.com/jmannall/Edge-diffraction-Matlab-toolbox.git
exec /vol/hpc-software/software/matlab/R2021a/bin/matlab -nodisplay -nosplash -r "addpath(genpath('/mnt/fast/nobackup/users/jm01527/misc-files')); addpath(genpath('Diffraction-toolbox')); addpath(genpath('Edge-diffraction-Matlab-toolbox')); fileName = '$1'; run('GenerateAudio(fileName, $2 + 1)'); quit"
rm -f -r Diffraction-toolbox
rm -f -r Edge-diffraction-Matlab-toolbox