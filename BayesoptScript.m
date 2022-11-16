%% BayesoptScript

clc;
clear;
close all;

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
numFilters = 2;
nBands = 12;
[~, tfmag, ~, fvec, ~] = DefaultBTM(controlparameters);
[~, ~, fidx] = CreateFrequencyNBands(tfmag, fvec, nBands);
biquad = false;
if biquad
    filterFunc = @(output, target) BiquadLoss(output, target, numFilters, nfft, fs, fidx);
    numOutputs = 4 * numFilters + 1;
    controlparameters.filterType = 'Biquad';
else
    filterFunc = @(output, target) IIRFilterLoss(output, target, numFilters, nfft, fs, fidx);
    numOutputs = 2 * numFilters + 1;
    controlparameters.filterType = 'IIR';
end
lossFunc = @(net, trainingData, targetData) NNFilterLoss(net, trainingData, targetData, filterFunc, true);

% Define network parameters
networkSize = 700;

% Optimise hyperparameters
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)

%% Run 2

networkSize = 350;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)