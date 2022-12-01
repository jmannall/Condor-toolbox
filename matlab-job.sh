#!/bin/bash
exec /vol/hpc-software/software/matlab/R2021a/bin/matlab -nodisplay -nosplash -r "addpath(genpath('/mnt/fast/nobackup/users/jm01527')); run('CondorScript($1)'); quit"