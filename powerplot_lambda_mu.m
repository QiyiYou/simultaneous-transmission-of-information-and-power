clear; close all;
%% Initial value set
nSubcarriers = 10;
noiseLevel = 1;
% Typical value set of Lambda
lagrangeMultiplierLambda = 0: 0.1: 16;
lagrangeMultiplierMu = 0: 0.1: 16;
filterTaps = [0.1+0.1i, 0.2+0.8i, 0.01+0.2i, 1+1i, 3+1i, 0.1+0.7i, 0.09+0.02i, 0.1+0.8i, 0.4+0.8i, 0.1+0.3i];
%% Calculate and plot carriers power
carrierGain = abs(filterTaps) .^2;
carrierPowerTx = waterfilling_rx_lambda_mu(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps);
carrierPowerRx = carrierGain' .* carrierPowerTx;
totalPowerTx = sum(carrierPowerTx);
totalPowerRx = sum(carrierPowerRx);
sizeOfPowerTx = size(totalPowerTx);
sizeOfPowerRx = size(totalPowerRx);
totalPowerTx = reshape(totalPowerTx, sizeOfPowerTx(2), sizeOfPowerTx(3));
totalPowerRx = reshape(totalPowerRx, sizeOfPowerRx(2), sizeOfPowerRx(3));
% Power efficiency
figure;
mesh(lagrangeMultiplierMu, lagrangeMultiplierLambda, totalPowerRx ./ totalPowerTx);
title('Power efficiency for variable Lambda and Mu');
xlabel('Mu')
ylabel('Lambda')
zlabel('Received power over transmitted power')
