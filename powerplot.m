%% Initial value set
nSubcarriers = 10;
noiseLevel = 1;
lagrangeMultiplier = 1;
filterTaps = [0.1+0.1i, 0.2+0.8i, 0.01+0.2i, 1+1i, 3+1i, 0.1+0.7i, 0.09+0.02i, 0.1+0.8i, 0.4+0.8i, 0.1+0.3i];

%% Calculate and plot carriers power
carrierPower = waterfilling(nSubcarriers, noiseLevel, lagrangeMultiplier, filterTaps);

bar(carrierPower);