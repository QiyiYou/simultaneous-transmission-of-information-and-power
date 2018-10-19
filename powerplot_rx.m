clear; close all;
%% Initial value set
nSubcarriers = 10;
noiseLevel = 1;
% Typical value set of Lambda
lagrangeMultiplierLambda = [2 3 4 5];
lagrangeMultiplierMu = 0.2;
filterTaps = [0.1+0.1i, 0.2+0.8i, 0.01+0.2i, 1+1i, 3+1i, 0.1+0.7i, 0.09+0.02i, 0.1+0.8i, 0.4+0.8i, 0.1+0.3i];
%% Calculate and plot carriers power
[carrierPowerTx, waterLevel] = waterfilling_rx(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps);
carrierNoise = noiseLevel ./ abs(filterTaps) .^2;

% Power allocated to subcarriers for Lambda 1
figure;
carrierPowerTxFig1 = subplot(4, 1, 1);
carrierStatus1 = [carrierNoise; carrierPowerTx(:, 1)'];
bar(carrierPowerTxFig1, carrierStatus1', 'stacked');
hold on
threshold1 = bar(carrierPowerTxFig1, waterLevel(:, 1), 'FaceColor','none', 'LineWidth', 1, 'LineStyle', '--');
title(['Carrier power (Lambda = ', num2str(lagrangeMultiplierLambda(1)), ')']);
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')
ylim([0 1.25 * max(waterLevel(:, 1))])
legend('Noise', 'Power', 'Threshold', 'Location', 'bestoutside')

% Lambda 2
carrierPowerTxFig2 = subplot(4, 1, 2);
carrierStatus2 = [carrierNoise; carrierPowerTx(:, 2)'];
bar(carrierPowerTxFig2, carrierStatus2', 'stacked');
hold on
threshold2 = bar(carrierPowerTxFig2, waterLevel(:, 2), 'FaceColor','none', 'LineWidth', 1, 'LineStyle', '--');
title(['Carrier power (Lambda = ', num2str(lagrangeMultiplierLambda(2)), ')']);
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')
ylim([0 1.25 * max(waterLevel(:, 2))])
legend('Noise', 'Power', 'Threshold', 'Location', 'bestoutside')

% Lambda 3
carrierPowerTxFig3 = subplot(4, 1, 3);
carrierStatus3 = [carrierNoise; carrierPowerTx(:, 3)'];
bar(carrierPowerTxFig3, carrierStatus3', 'stacked');
hold on
threshold3 = bar(carrierPowerTxFig3, waterLevel(:, 3), 'FaceColor','none', 'LineWidth', 1, 'LineStyle', '--');
title(['Carrier power (Lambda = ', num2str(lagrangeMultiplierLambda(3)), ')']);
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')
ylim([0 1.25 * max(waterLevel(:, 3))])
legend('Noise', 'Power', 'Threshold', 'Location', 'bestoutside')

% Lambda 4
carrierPowerTxFig4 = subplot(4, 1, 4);
carrierStatus4 = [carrierNoise; carrierPowerTx(:, 4)'];
bar(carrierPowerTxFig4, carrierStatus4', 'stacked');
hold on
threshold4 = bar(carrierPowerTxFig4, waterLevel(:, 4), 'FaceColor','none', 'LineWidth', 1, 'LineStyle', '--');
title(['Carrier power (Lambda = ', num2str(lagrangeMultiplierLambda(4)), ')']);
xlabel('Carrier index')
ylabel('Power (N0/|hn|^2)')
ylim([0 1.25 * max(waterLevel(:, 4))])
legend('Noise', 'Power', 'Threshold', 'Location', 'bestoutside')
