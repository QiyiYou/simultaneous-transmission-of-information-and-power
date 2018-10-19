clear; close all;
%% Initial value set
nSubcarriers = 10;
noiseLevel = 1;
% Typical value set of Lambda (fix Mu as 0.2)
lagrangeMultiplierLambda = 0: 0.01: 16;
lagrangeMultiplierMu = 0.2;
filterTaps = [0.1+0.1i, 0.2+0.8i, 0.01+0.2i, 1+1i, 3+1i, 0.1+0.7i, 0.09+0.02i, 0.1+0.8i, 0.4+0.8i, 0.1+0.3i];
%% Calculate and plot carriers power
carrierGain = abs(filterTaps) .^2;
carrierPowerTx = waterfilling_rx(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps);
carrierPowerRx = carrierGain' .* carrierPowerTx;
totalPowerTx = sum(carrierPowerTx);
totalPowerRx = sum(carrierPowerRx);
% Power efficiency
figure;
plot(lagrangeMultiplierLambda, totalPowerRx ./ totalPowerTx);
title(['Power efficiency when Mu is ', num2str(lagrangeMultiplierMu)]);
xlabel('Lambda')
ylabel('Received power over transmitted power')
