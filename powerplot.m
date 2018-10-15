clear; close all;
%% Initial value set
nSubcarriers = 10;
noiseLevel = 1;
lagrangeMultiplier = 1;
filterTaps = [0.1+0.1i, 0.2+0.8i, 0.01+0.2i, 1+1i, 3+1i, 0.1+0.7i, 0.09+0.02i, 0.1+0.8i, 0.4+0.8i, 0.1+0.3i];

%% Calculate and plot carriers power
carrierPower = waterfilling(noiseLevel, lagrangeMultiplier, filterTaps);
carrierGain = abs(filterTaps);

figure;

carrierPowerFig = subplot(3, 1, 1);
bar(carrierPowerFig, carrierPower);
title('Power allocated to subcarriers');
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')

carrierGainFig = subplot(3, 1, 2);
stem(carrierGainFig, carrierGain);
title('Subchannels absolute value');
xlabel('Carrier index')
ylabel('Absolute channel filter tap')

carrierPowerGainFig = subplot(3, 1, 3);
stem(carrierGain, carrierPower);
title('Optimal power allocations w.r.t. subchannel gain');
xlabel('Carrier Gain')
ylabel('Power (N0/|hn|^2)')

% carrierNoise = noiseLevel ./ abs(filterTaps) .^2;
% carrierStatus = [carrierNoise; carrierPower];
% bar(carrierStatus', 'stacked');
% title('Optimal power allocations w.r.t. subchannel noise');
% xlabel('Carrier index')
% ylabel('Power')
% legend('Noise','Power')
