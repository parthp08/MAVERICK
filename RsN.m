function RsN = RsN()
% returns the transformation of N-frame to Rs-frame(Sun Pointing 
% reference frame)

% motion of Rs as seen by the N always will be stationary
% so angular velocity of Rs relative to N will be zero
% Rs-frame = [-n1, n2x-n1, n2]
RsN = [-1,0,0;0,0,1;0,1,0];
end