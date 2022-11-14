%% BayesoptScript

clc;
clear;
close all;

ver

basePath = '/mnt/fast/nobackup/users/jm01527/';
addpath(genpath([basePath, 'Diffraction-toolbox']))
addpath(genpath([basePath, 'Edge-diffraction-Matlab-toolbox']))
addpath(genpath([basePath, 'misc-files']))

% Create controlparamters struct
fs = 96e3;
nfft = 4096;
c = 344;
controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2);

% Create loss function
numBiquads = 2;
nBands = 12;
[~, tfmag, ~, fvec, ~] = DefaultBTM(controlparameters);
[~, ~, fidx] = CreateFrequencyNBands(tfmag, fvec, nBands);
lossFunc = @(net, trainingData, targetData) NNBiquadLoss(net, trainingData, targetData, numBiquads, nfft, fs, fidx, true);

% Define network parameters
numOutputs = 4 * numBiquads + 1;
networkSize = 700;

% Optimise hyperparameters
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)

networkSize = 350;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)