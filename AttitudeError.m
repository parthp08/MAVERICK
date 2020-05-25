function [beta_BR,wB_BR] = AttitudeError(t, sigma_BN, wB_BN, RN, wN_RN)
% gives error in quaterinons and angular velocity
% between body frame and reference frame
% for all 3 science mode of the spacecraft
% 
% quat : [q1, q2:q4]
% 
% Inputs:
%   t: time
%   RN: DCM of R relative to N
%   wN_RN: angular vel of R w.r.t. N given in N-frame
% Outputs:
%   beta_BR: error quaternions of B-frame relative to R-frame
%   w_BR: error angular vel of B-frame relative to R-frame

BN = mrp2dcm(sigma_BN);

RB = RN*(BN');
beta_BR = dcm2mrp(RB');
wN_BR = (BN')*wB_BN - wN_RN;
wB_BR = BN*wN_BR;
end
