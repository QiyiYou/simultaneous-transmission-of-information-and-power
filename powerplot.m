clear; close all;
%% Initial value set
nSubcarriers = 10;
noiseLevel = 1;
lagrangeMultiplier = 1;
filterTaps = [0.1+0.1i, 0.2+0.8i, 0.01+0.2i, 1+1i, 3+1i, 0.1+0.7i, 0.09+0.02i, 0.1+0.8i, 0.4+0.8i, 0.1+0.3i];
%% Calculate and plot carriers power
[carrierPower, waterLevel] = waterfilling(noiseLevel, lagrangeMultiplier, filterTaps);
carrierFadingParameters = abs(filterTaps);
carrierNoise = noiseLevel ./ abs(filterTaps) .^2;

% Power allocated to subcarriers
figure;
carrierPowerFig = subplot(3, 1, 1);
carrierStatus = [carrierNoise; carrierPower];
bar(carrierPowerFig, carrierStatus', 'stacked');
% Threshold or waterlevel
threshold = line([0, nSubcarriers + 1], [waterLevel, waterLevel],'Color','black','linestyle','--');
title('Power allocated to subcarriers');
xlabel('Carrier index')
ylabel('Power (N0 / |hn| ^2)')
ylim([0 1.5 * waterLevel])
legend('Noise', 'Power', 'Threshold')

% Subchannel fading parameters
carrierFadingParameterFig = subplot(3, 1, 2);
stem(carrierFadingParameterFig, carrierFadingParameters);
title('Subchannels absolute value');
xlabel('Carrier index')
ylabel('Absolute fading parameters')

% Power w.r.t. fading parameters
carrierPowerFadingParameterFig = subplot(3, 1, 3);
bar(carrierFadingParameters, carrierPower);
title('Optimal power allocations w.r.t. subchannel fading parameter');
xlabel('Absolute fading parameters')
ylabel('Power (N0/|hn|^2)')
