function wN_RcN = wN_RcN(t)
% returns angular velocity of Rc-frame 
% relative to N-frame described in N-frame

RcN_1 = RcN_t(t);
RcN_2 = RcN_t(t+0.01);

% DCM_dot = DCM*w
% w = DCM'*DCM_dot
w = RcN_1'*(RcN_2-RcN_1)/0.01; % finite diff
wN_RcN = [-w(3,2); -w(1,3); -w(2,1)];
end
