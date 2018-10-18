% Function: allocate power to subchannels based on water-filling algorithm,
%   with power constraint at the receiver
%
% InputArgs:
%   - nSubcarriers: number of subcarriers (unused)
%   - noiseLevel: noise in subchannels (assume LTI)
%   - lagrangeMultiplierLambda, lagrangeMultiplierMu: Lagrange multipliers
%       of Lagrange method
%   - filterTaps: complex channel filter tap (assume LTI)
%
% OutputArg:
%   - power allocated to subcarriers
%
% Author & Date: Yang (i@snowztail.com) - 09 Oct 18
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

