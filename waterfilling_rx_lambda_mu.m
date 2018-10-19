% Function: allocate power to subchannels based on water-filling algorithm,
%   with power constraint at the receiver
%
% InputArgs:
%   - noiseLevel: noise in subchannels (assume LTI)
%   - lagrangeMultiplierLambda, lagrangeMultiplierMu: Lagrange multipliers
%       of Lagrange method, as vectors
%   - filterTaps: complex channel filter tap (assume LTI)
%
% OutputArg:
%   - power allocated to subcarriers
%
% Restraints:
%   - power transmitted no more than budget
%   - non-negative carrier power
%   - power received more than a threshold
%
% Comments:
%   - vary lagrangeMultiplierLambda (determined by average carrier TX power
%       P) and lagrangeMultiplierMu (determined by RX power budget Pd) to
%       investigate how the constraints influence carrier power and total
%       power efficiency
%   - the carrier in better status (with larger fading parameter) should
%       always be allocated with more power in theory; otherwise, the case
%       is invalid for current value set
%   - the aim is to find valid parameter sets that satisfy:
%       1) high power efficiency
%       2) more power to better carrier
%
% Author & Date: Yang (i@snowztail.com) - 18 Oct 18

function [carrierPowerTx] = waterfilling_rx_lambda_mu(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps)
nLambda = length(lagrangeMultiplierLambda);
nMu = length(lagrangeMultiplierMu);
nCarriers = length(filterTaps);
carrierPowerTx = zeros(nCarriers, nLambda, nMu);
for iLambda = 1: nLambda
    for iMu = 1: nMu
    carrierPowerTx(:, iLambda, iMu) = 1 ./ (lagrangeMultiplierLambda(iLambda) - lagrangeMultiplierMu(iMu) .* abs(filterTaps) .^2) - noiseLevel ./ abs(filterTaps) .^2;
    end
end
carrierPowerTx(carrierPowerTx < 0) = 0;
end
