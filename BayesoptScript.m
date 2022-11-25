%% BayesoptScript

clc;
clear;
close all;

%basePath = '/mnt/fast/nobackup/users/jm01527/';
%addpath(genpath([basePath, 'Diffraction-toolbox']))
%addpath(genpath([basePath, 'Edge-diffraction-Matlab-toolbox']))
%addpath(genpath([basePath, 'misc-files']))

%% Set up data
fs = 96e3;
nfft = 16384;
c = 344;
controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2);

numFilters = 2;
nBands = 12;
[~, tfmag, ~, fvec, ~] = DefaultBTM(controlparameters);
[~, ~, fidx] = CreateFrequencyNBands(tfmag, fvec, nBands);

%% Biquads
filterFunc = @(output, target) BiquadLoss(output, target, numFilters, nfft, fs, fidx);
numOutputs = 4 * numFilters + 1;
controlparameters.filterType = 'Biquad';

lossFunc = @(net, trainingData, targetData) NNFilterLoss(net, trainingData, targetData, filterFunc, true);

% Optimise hyperparameters
disp('Biquad - 700')
networkSize = 700;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)

disp('Biquad - 350')
networkSize = 350;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)

%% IIR filters
filterFunc = @(output, target) IIRFilterLoss(output, target, numFilters, nfft, fs, fidx);
numOutputs = 2 * numFilters + 1;
controlparameters.filterType = 'IIR';

lossFunc = @(net, trainingData, targetData) NNFilterLoss(net, trainingData, targetData, filterFunc, true);

% Optimise hyperparameters
disp('IIR - 700')
networkSize = 700;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)

disp('IIR - 350')
networkSize = 350;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)