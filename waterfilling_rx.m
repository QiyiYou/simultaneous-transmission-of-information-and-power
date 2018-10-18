% Function: allocate power to subchannels based on water-filling algorithm,
%   with power constraint at the receiver
%
% InputArgs:
%   - noiseLevel: noise in subchannels (assume LTI)
%   - lagrangeMultiplierLambda, lagrangeMultiplierMu: Lagrange multipliers
%       of Lagrange method
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
%   - lagrangeMultiplierMu is fixed
%   - vary lagrangeMultiplierLambda to investigate the effect on carrier
%       power
%   - the carrier in better status (with larger fading parameter) should
%       always be allocated with more power in theory; otherwise, the case
%       is invalid for current value lambda
%
% Author & Date: Yang (i@snowztail.com) - 09 Oct 18

function [carrierPowerTx] = waterfilling_rx(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps)
nLambda = length(lagrangeMultiplierLambda);
nCarriers = length(filterTaps);
carrierPowerTx = zeros(nCarriers, nLambda);

% Calculate power for different lambda
for iLambda = 1: nLambda
    carrierPowerTx(:, iLambda) = 1 ./ (lagrangeMultiplierLambda(iLambda) - lagrangeMultiplierMu .* abs(filterTaps) .^2) - noiseLevel ./ abs(filterTaps) .^2;
end
carrierPowerTx(carrierPowerTx < 0) = 0;
end

