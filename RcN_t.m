function RcN = RcN_t(t)
% returns the transformation of N-frame to Rc-frame(Communication
% satellite pointing reference frame) for a given time(in seconds)

[r_GMO,v_GMO] = PosVelOrbit(20424.2,0,0,250,t);
[r_LMO,v_LMO] = PosVelOrbit(3.7962e+03,20,30,60,t);

% in N-frame
delta_r = r_GMO - r_LMO;
delta_r = delta_r/norm(delta_r);

% Rc-frame = [-(Nr_gmo-Nr_lmo), -(r1xn3)/|r1xn3|, r1xr2]
r1 = -(delta_r);
r2 = cross(delta_r,[0;0;1])/norm(cross(delta_r,[0;0;1]));
r3 = cross(r1,r2);
NRc = [r1,r2,r3];
RcN = NRc';
end
