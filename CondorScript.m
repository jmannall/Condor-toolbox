
function CondorScript(idx)
    epochSize = 20e3;
    
    fs = 96e3;
    nfft = 16384;
    c = 344;
    controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2);
    
    % gpuDevice(1)
    seed = 1 + round(1e9 * rand(1))
    rng(seed)

    [trainingData, targetData] = CreateBtmTrainingData(epochSize, controlparameters, idx + 1);
end
