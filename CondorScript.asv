
function CondorScript(idx, fs, weighted)

    disp(idx)
    disp('Hello World')

    mkdir('results')
    mkdir(['results', filesep, 'CreateBtmTrainingData'])
    mkdir(['results', filesep, 'SingleWedge'])
    mkdir(['results', filesep, 'DefaultBTM'])

    poolobj = gcp
    if isempty(poolobj)
        parpool([1 48]);
    end

    epochSize = 20e3;
    
    nfft = 16384;
    c = 344;
    controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2);
    
    % gpuDevice(1)
    seed = idx;
    rng(seed)
    
    seed = round(2 ^ 32 * rand(1)) - 1
    rng(seed)
    
    numDataSets = 10;
    
    if weighted
        weight = 20;
        dataFunc = @(saveIdx)CreateBtmTrainingDataWeighted(epochSize, controlparameters, weight, saveIdx);
    else
        dataFunc = @(saveIdx)CreateBtmTrainingData(epochSize, controlparameters, saveIdx);
    end

    for i = 1:numDataSets
        saveIdx = idx * numDataSets + i;
        [~, ~] = dataFunc(saveIdx);
    end
end