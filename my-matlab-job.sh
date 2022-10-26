#!/bin/bash
exec /opt/bin/matlab -nodisplay -nojvm -nosplash -r \
        "run('myscript.m'); quit"
