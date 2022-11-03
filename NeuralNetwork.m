function NeuralNetwork(networkFunction)

    clc;
    clear;
    close all;
    set(0, 'DefaultLineLineWidth', 2);
    set(groot, 'defaultLineMarkerSize', 10)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% NN
    disp('Check 1');
    learnRate = optimizableVariable('lR',[1e-5 1e-1],'Type','real','Transform','log');
    gradDecay = optimizableVariable('gD',[0.5 1],'Type','real');
    sqGradDecay = optimizableVariable('sGD',[0.8 1],'Type','real');
    maxGradient = optimizableVariable('mG',[0.5 10],'Type','real','Transform','log');
    
    networkFunction = @(x)XORNeuralNetwork(x);
    result = bayesopt(networkFunction, [learnRate, gradDecay, sqGradDecay, maxGradient], 'UseParallel', true);
    
    xObs = result.XAtMinObjective;
    xEst = result.XAtMinEstimatedObjective;

    disp('Check 2')
    [lossObs, netObs] = networkFunction(xObs)
    [lossEst, netEst] = networkFunction(xEst)
    disp('ParamsObs', num2str(netObs))
    disp('ParamsEst', num2str(netEst))

end
