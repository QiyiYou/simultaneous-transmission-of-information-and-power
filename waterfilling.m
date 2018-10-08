% Function: allocate power to subchannels based on water-filling algorithm
%
% InputArgs:
%   - nSubcarriers: number of subcarriers (unused)
%   - noiseLevel: noise in subchannels (assume LTI)
%   - lagrangeMultiplier: Lagrange multiplier of Lagrange method
%   - filterTaps: complex channel filter tap (assume LTI)
%
% OutputArg:
%   - power allocated to subcarriers
%
% Author & Date: Yang (i@snowztail.com) - 08 Oct 18
function [carrierPower] = waterfilling(noiseLevel, lagrangeMultiplier, filterTaps)
carrierPower = 1 / lagrangeMultiplier - abs(filterTaps) .^2 / noiseLevel;
carrierPower(carrierPower < 0) = 0;
end

