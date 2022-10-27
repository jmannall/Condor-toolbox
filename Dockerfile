# Build from the MATLAB base image
FROM mathworks/matlab:r2022b

# Copy your script/function to be executed.
COPY myscript.m ./

# Start MATLAB in batch mode and execute your script/function.
CMD ["matlab","-batch","myscript"]