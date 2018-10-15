clear; close all;
%% Initial value set
nSubcarriers = 10;
noiseLevel = 1;
% Typical value set of Lambda
lagrangeMultiplierLambda = 0: 0.1: 16;
lagrangeMultiplierMu = 0.2;
filterTaps = [0.1+0.1i, 0.2+0.8i, 0.01+0.2i, 1+1i, 3+1i, 0.1+0.7i, 0.09+0.02i, 0.1+0.8i, 0.4+0.8i, 0.1+0.3i];

%% Calculate and plot carriers power
carrierPower = waterfilling_rx(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps);
totalPower = sum(carrierPower);
figure;

plot(lagrangeMultiplierLambda, totalPower);


% carrierPowerFig1 = subplot(4, 1, 1);
% bar(carrierPowerFig1, carrierPower(:, 1));
% title('Power allocated to subcarriers');
% xlabel('Carrier index')
% ylabel('Power (N0/|hn|^2)')
% 
% carrierPowerFig1 = subplot(4, 1, 2);
% bar(carrierPowerFig1, carrierPower(:, 2));
% title('Power allocated to subcarriers');
% xlabel('Carrier index')
% ylabel('Power (N0/|hn|^2)')
% 
% carrierPowerFig1 = subplot(4, 1, 3);
% bar(carrierPowerFig1, carrierPower(:, 3));
% title('Power allocated to subcarriers');
% xlabel('Carrier index')
% ylabel('Power (N0/|hn|^2)')
% 
% carrierPowerFig1 = subplot(4, 1, 4);
% bar(carrierPowerFig1, carrierPower(:, 4));
% title('Power allocated to subcarriers');
% xlabel('Carrier index')
% ylabel('Power (N0/|hn|^2)')

% carrierNoise = noiseLevel ./ abs(filterTaps) .^2;
% carrierStatus = [carrierNoise; carrierPower];
% bar(carrierStatus', 'stacked');
% title('Optimal power allocations w.r.t. subchannel noise');
% xlabel('Carrier index')
% ylabel('Power')
% legend('Noise','Power')
