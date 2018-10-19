% Function: allocate power to subchannels based on water-filling algorithm
%
% InputArgs:
%   - noiseLevel: noise in subchannels (assume LTI)
%   - lagrangeMultiplier: Lagrange multiplier of Lagrange method
%   - filterTaps: complex channel filter tap (assume LTI)
%
% OutputArg:
%   - power allocated to subcarriers
%   - water level as carriers upper power plus noise bound
%
% Restraints:
%   - power transmitted no more than budget
%   - non-negative carrier power
%
% Comments:
%   - lagrangeMultiplier is fixed
%
% Author & Date: Yang (i@snowztail.com) - 08 Oct 18

function [carrierPower, waterLevel] = waterfilling(noiseLevel, lagrangeMultiplier, filterTaps)
carrierPower = 1 / lagrangeMultiplier - noiseLevel ./ abs(filterTaps) .^2;
waterLevel = 1 / lagrangeMultiplier;
carrierPower(carrierPower < 0) = 0;
waterLevel(waterLevel < 0) = 0;
end

