function wN_RnN = wN_RnN(t)
% returns angular velocity of Rn-frame 
% relative to N-frame described in N-frame

% wN_RnN = (NH)*(W_RnH + W_HN)
% angular velocity w.r.t H-frame is zero
% angular vel of H-frame w.r.t N-frame
theta_dot = 0.000884797;  % rad/sec % for nano sat
w_HN = [0; 0; theta_dot]; % const
wN_RnN = (HN_t(t)') * w_HN;
end

