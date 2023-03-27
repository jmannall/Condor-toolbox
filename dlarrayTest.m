z = dlarray(2 + 3i);

r= real(z);
im = imag(z);

disp(['Complex: ' num2str(z)])
disp(['Real: ' num2str(r)])
disp(['Imaginary: ' num2str(im)])

%%

fs = 48e3;
nfft = 2*8192;
c = 344;

controlparameters = struct('fs', 2 * fs, 'nfft', 2 * nfft, 'difforder', 1, 'c', c, 'saveFiles', 3, 'noDirect', true);DefaultBTM(controlparameters);

[~, tfmag, ~, fvec] = DefaultBTM(controlparameters);

fvec = fvec(1:end / 2);
tfmag = tfmag(1:end / 2);
%%

close all

gammaFiltBank = gammatoneFilterBank([50,20e3], 'SampleRate', fs, 'NumFilters',24);
%fvtool(gammaFiltBank)
[h,w] = freqz(gammaFiltBank);

total = mag2db(abs(sum(h, 2)));
h = mag2db(abs(h));

figure
semilogx(w, h)
xlim([20 20e3])

figure
semilogx(fvec, tfmag)
xlim([20 20e3])
ylim([-40 0])
figure
semilogx(w, total)
xlim([20 20e3])
ylim([-250 50])

tfmagGamma = tfmag + total;

figure
semilogx(w, tfmagGamma)
xlim([20 20e3])
ylim([-40 0])

