function [r_n, rdot_n] = PosVelOrbit(radius, gamma, i, theta_t0, t)
% compute inertial position and velocity vector for 
% circular martian orbit
%
% Inputs:
%   radius: radius of the circular orbit
%   gamma: right ascension node
%   i: inclination angle
%   theta: true latitude angle
%   t: time in seconds 
% Outputs:
%   r_n: inertial position vector
%   rdot_n: inertial velocity vector

mu = 42828.3;   % km^3/s^2 % gravity const for mars
theta_dot = rad2deg(sqrt(mu/radius^3)); % rad/sec % const

gamma = deg2rad(gamma);
i = deg2rad(i);
theta_at_t = theta_t0 + theta_dot*t;
theta = deg2rad(theta_at_t);

% argument of perigee
w = 0; % for circular orbit

% x and y pos in perifocal plane % z == 0
x = radius*cos(theta); % e = 0
y = radius*sin(theta);
x_dot = -sqrt(mu/radius)*sin(theta);
y_dot = sqrt(mu/radius)*cos(theta);

% from perifocal to ECI frame
% r_n = DCM * [x,y,0]'
cos_g = cos(gamma);
sin_g = sin(gamma);
cos_i = cos(i);
sin_i = sin(i);
cos_w = cos(w);
sin_w = sin(w);
r_n = [
    (cos_g*cos_w-sin_g*sin_w*cos_i)*x + (-cos_g*sin_w-sin_g*cos_w*cos_i)*y;
    (sin_g*cos_w+cos_g*sin_w*cos_i)*x + (-sin_g*sin_w+cos_g*cos_w*cos_i)*y;
    (sin_w*sin_i)*x + (cos_w*sin_i)*y;
];
rdot_n = [
    (cos_g*cos_w-sin_g*sin_w*cos_i)*x_dot + (-cos_g*sin_w-sin_g*cos_w*cos_i)*y_dot;
    (sin_g*cos_w+cos_g*sin_w*cos_i)*x_dot + (-sin_g*sin_w+cos_g*cos_w*cos_i)*y_dot;
    (sin_w*sin_i)*x_dot + (cos_w*sin_i)*y_dot;
];
end
