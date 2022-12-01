
function CondorScript(idx)

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
    
    fs = 96e3;
    nfft = 16384;
    c = 344;
    controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2);
    
    % gpuDevice(1)
    seed = 1e3 * idx;
    rng(seed)
    
    seed = round(2 ^ 32 * rand(1)) - 1
    rng(seed)
    
    numDataSets = 10;
    for i = 1:numDataSets
        idx = numDataSets * idx + i;
        [trainingData, targetData] = CreateBtmTrainingData(epochSize, controlparameters, numDataSets * idx + i);
    end
end