function CondorScriptSingle(fs, weighted)

    idx = 20e3;
    disp('Hello World')

    mkdir('results')
    mkdir(['results', filesep, 'CreateBtmTrainingData'])
    mkdir(['results', filesep, 'SingleWedge'])
    mkdir(['results', filesep, 'DefaultBTM'])

    %poolobj = gcp
    %if isempty(poolobj)
    %    parpool([1 48]);
    %end
    parpool([1 48]);

    epochSize = 20e3;
    
    nfft = 16384;
    c = 344;
    
    % gpuDevice(1)
    seed = idx;
    rng(seed)
    
    seed = round(2 ^ 32 * rand(1)) - 1
    rng(seed)
        
    if nargin > 1
        controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2, 'noDirect', true);
        if weighted
            weight = 20;
            dataFunc = @(saveIdx)CreateBtmTrainingDataWeighted(epochSize, controlparameters, weight, saveIdx);
        else
            dataFunc = @(saveIdx)CreateBtmTrainingData(epochSize, controlparameters, saveIdx);
        end
        [~, ~] = dataFunc(idx);
    else
        weight = 20;
        fs = 96e3;
        controlparameters = struct('fs', fs, 'nfft', nfft, 'difforder', 1, 'c', c, 'saveFiles', 2);
        [~, ~] = CreateBtmTrainingData(epochSize, controlparameters, idx);
        [~, ~] = CreateBtmTrainingDataWeighted(epochSize, controlparameters, weight, idx);

        controlparameters.fs = 88.2e3;
        [~, ~] = CreateBtmTrainingData(epochSize, controlparameters, idx);
        [~, ~] = CreateBtmTrainingDataWeighted(epochSize, controlparameters, weight, idx);    
    end
end