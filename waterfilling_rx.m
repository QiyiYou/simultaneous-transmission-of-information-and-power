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
function [carrierPower] = waterfilling_rx(noiseLevel, lagrangeMultiplierLambda, lagrangeMultiplierMu, filterTaps)
carrierPower = 1 ./ (lagrangeMultiplierLambda - lagrangeMultiplierMu .* abs(filterTaps) .^2) - noiseLevel ./ abs(filterTaps) .^2;
carrierPower(carrierPower < 0) = 0;
end

