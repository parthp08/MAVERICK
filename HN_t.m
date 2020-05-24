function HN = HN_t(t)
% returns the transformation from N-frame(inertial) to 
% H-frame(Orbit) for given time(in seconds)

gamma = deg2rad(20);
i = deg2rad(30);
theta_t0 = deg2rad(60);
theta_dot = 0.000884797; % rad/sec % const
theta_at_t = theta_t0 + theta_dot*t;

% argument of perigee
%w = 0; % for circular orbit

cos_g = cos(gamma);
sin_g = sin(gamma);
cos_i = cos(i);
sin_i = sin(i);
cos_w = cos(theta_at_t);
sin_w = sin(theta_at_t);

% 313 euler angle
% HN = Rz(-theta_at_t)*Rx(-i)*Rz(-gamma)
% HN = NH'
HN = [
    (cos_g*cos_w-sin_g*sin_w*cos_i), (-cos_g*sin_w-sin_g*cos_w*cos_i), (sin_g*sin_i);
    (sin_g*cos_w+cos_g*sin_w*cos_i), (-sin_g*sin_w+cos_g*cos_w*cos_i), (-cos_g*sin_i);
    (sin_w*sin_i), (cos_w*sin_i), (cos_i);
]';
end
