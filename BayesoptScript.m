%% BayesoptScript

clc;
clear;
close all;

% thetaS = 10;
% thetaR = 290;
% wedgeIndex = 320;
% wedgeLength = 20;
% zS = 9;
% zR = 14;
% radiusS = 1;
% radiusR = 3;

% Create controlparamters struct
% fs = 96e3;
% nfft = 8192;
% c = 344;
% controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2);
% createPlot = false;

% [ir] = DefaultBTM(controlparameters);
% disp('Default BTM success')

% [~, tfmag, ~, fvec, tfcomplex] = SingleWedge(wedgeLength, wedgeIndex, thetaS, thetaR, radiusS, radiusR, zS, zR, controlparameters, createPlot);

% thetaS = 30;
% thetaR = 310;
% [~, tfmag2, ~, fvec, tfcomplex] = SingleWedge(wedgeLength, wedgeIndex, thetaS, thetaR, radiusS, radiusR, zS, zR, controlparameters, createPlot);

% L = sqrt((radiusS + radiusR) ^ 2 + (zR - zS) ^ 2);
% [~, tfmag3, ~, fvec, tfcomplex] = SingleWedge(wedgeLength, wedgeIndex, thetaS, thetaR, radiusS, radiusR, zS, zR, controlparameters, createPlot);
% 
% tfmag3 = mag2db(abs(L * [tfcomplex.diff1]));
% [tfmag, fvec, tfcomplex] = SingleWedgeInterpolated(wedgeLength, wedgeIndex, thetaS, thetaR, radiusS, radiusR, zS, zR, controlparameters, createPlot);
% controlparameters.Rstart = L;
% [tfmag2, fvec, tfcomplex] = SingleWedgeInterpolated(wedgeLength, wedgeIndex, thetaS, thetaR, radiusS, radiusR, zS, zR, controlparameters, createPlot);
% 
% figure
% semilogx(fvec, [tfmag.diff1])
% hold on
% semilogx(fvec, [tfmag2.diff1], '--')

%basePath = '/mnt/fast/nobackup/users/jm01527/';
%addpath(genpath([basePath, 'Diffraction-toolbox']))
%addpath(genpath([basePath, 'Edge-diffraction-Matlab-toolbox']))
%addpath(genpath([basePath, 'misc-files']))

% Create controlparamters struct
fs = 96e3;
nfft = 8192;
c = 344;
controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2);

% Create loss function
numFilters = 2;
nBands = 12;
[~, tfmag, ~, fvec, ~] = DefaultBTM(controlparameters);
[~, ~, fidx] = CreateFrequencyNBands(tfmag, fvec, nBands);
biquad = true;
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
% epochSize = 1e3;
% networkSize = 20e3;
% numEpochs = 50;
% idx = 2;
% dataFunc = @() CreateBtmTrainingData(epochSize, controlparameters, idx);
% numNetworks = 8;
% const = ones(numNetworks, 1);
% lR = [1e-3; 1e-3; 1e-3; 1e-3; 1e-4; 1e-4; 1e-4; 1e-3];
% mG = [0.9; 0.9; 5; 5; 0.9; 0.9; 5; 5];
% gD = 0.9 * const;
% sGD = 0.99 * const;
% nL = [2; 6; 2; 6; 2; 6; 2; 6];
% x = table(lR, mG, gD, sGD, nL);
% CreateBTMNeuralNetwork(x(8,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);
% CreateBTMNeuralNetwork(x(2,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);
% CreateBTMNeuralNetwork(x(3,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);
% CreateBTMNeuralNetwork(x(4,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);
% CreateBTMNeuralNetwork(x(5,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);
% CreateBTMNeuralNetwork(x(6,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);
% CreateBTMNeuralNetwork(x(7,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);
% CreateBTMNeuralNetwork(x(1,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);

% biquad = false;
% if biquad
%     filterFunc = @(output, target) BiquadLoss(output, target, numFilters, nfft, fs, fidx);
%     numOutputs = 4 * numFilters + 1;
%     controlparameters.filterType = 'Biquad';
% else
%     filterFunc = @(output, target) IIRFilterLoss(output, target, numFilters, nfft, fs, fidx);
%     numOutputs = 2 * numFilters + 1;
%     controlparameters.filterType = 'IIR';
% end
% lossFunc = @(net, trainingData, targetData) NNFilterLoss(net, trainingData, targetData, filterFunc, true);
% CreateBTMNeuralNetwork(x(3,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);
% CreateBTMNeuralNetwork(x(4,:), lossFunc, dataFunc, networkSize, numOutputs, numEpochs);

% Optimise hyperparameters
networkSize = 700;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)

networkSize = 10e3;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)

networkSize = 350;
BayesoptNeuralNetwork(lossFunc, networkSize, numOutputs, controlparameters)