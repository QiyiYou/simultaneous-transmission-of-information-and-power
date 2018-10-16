clear; close all;
%% Initial value set
nSubcarriers = 10;
noiseLevel = 1;
% Typical value set of Lambda
lagrangeMultiplierLambda = [2 6 8 10];
lagrangeMultiplierMu = 0.2;
filterTaps = [0.1+0.1i, 0.2+0.8i, 0.01+0.2i, 1+1i, 3+1i, 0.1+0.7i, 0.09+0.02i, 0.1+0.8i, 0.4+0.8i, 0.1+0.3i];

%% Calculate and plot carriers power
carrierPowerTx = waterfilling_rx(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps);

figure;

carrierPowerTxFig1 = subplot(4, 1, 1);
bar(carrierPowerTxFig1, carrierPowerTx(:, 1));
title('Power allocated to subcarriers');
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')

carrierPowerTxFig2 = subplot(4, 1, 2);
bar(carrierPowerTxFig2, carrierPowerTx(:, 2));
title('Power allocated to subcarriers');
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')

carrierPowerTxFig3 = subplot(4, 1, 3);
bar(carrierPowerTxFig3, carrierPowerTx(:, 3));
title('Power allocated to subcarriers');
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')

carrierPowerTxFig4 = subplot(4, 1, 4);
bar(carrierPowerTxFig4, carrierPowerTx(:, 4));
title('Power allocated to subcarriers');
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')

% carrierNoise = noiseLevel ./ abs(filterTaps) .^2;
% carrierStatus = [carrierNoise; carrierPower];
% bar(carrierStatus', 'stacked');
% title('Optimal power allocations w.r.t. subchannel noise');
% xlabel('Carrier index')
% ylabel('Power')
% legend('Noise','Power')
