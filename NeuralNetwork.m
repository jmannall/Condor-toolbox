function NeuralNetwork(networkFunction)

    set(0, 'DefaultLineLineWidth', 2);
    set(groot, 'defaultLineMarkerSize', 10)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% NN
    learnRate = optimizableVariable('lR',[1e-5 1e-1],'Type','real','Transform','log');
    gradDecay = optimizableVariable('gD',[0.5 1],'Type','real');
    sqGradDecay = optimizableVariable('sGD',[0.8 1],'Type','real');
    maxGradient = optimizableVariable('mG',[0.5 10],'Type','real','Transform','log');
    
    result = bayesopt(networkFunction, [learnRate, gradDecay, sqGradDecay, maxGradient], 'UseParallel', true);
    
    xObs = result.XAtMinObjective;
    xEst = result.XAtMinEstimatedObjective;

    [lossObs, netObs] = networkFunction(xObs)
    [lossEst, netEst] = networkFunction(xEst)

end
