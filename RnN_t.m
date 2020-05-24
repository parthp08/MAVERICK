function RnN = RnN_t(t)
% returns the transformation of N-frame to Rs-frame(Nadir Pointing 
% reference frame) for a given time(in seconds)

% RnN_t = RnH * HN_t

% Rn-frame will always be fixed relative to H-frame
% but will have some agular velocity relative to N-frame
% Rn-frame = [-ir, itheta, -ir*itheta]
RnH = [-1,0,0; 0,1,0; 0,0,-1];

RnN = RnH*HN_t(t);
end