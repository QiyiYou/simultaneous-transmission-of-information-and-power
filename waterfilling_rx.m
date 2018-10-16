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
function [carrierPowerTx] = waterfilling_rx(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps)
nLambda = length(lagrangeMultiplierLambda);
nCarriers = length(filterTaps);
carrierPowerTx = zeros(nCarriers, nLambda);

for iLambda = 1: nLambda
    carrierPowerTx(:, iLambda) = 1 ./ (lagrangeMultiplierLambda(iLambda) - lagrangeMultiplierMu .* abs(filterTaps) .^2) - noiseLevel ./ abs(filterTaps) .^2;
end

carrierPowerTx(carrierPowerTx < 0) = 0;
end

