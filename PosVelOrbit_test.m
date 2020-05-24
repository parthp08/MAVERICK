clear all;
clc;

r_lmo = 3396.19+400; % for nano satellite
gamma = 20;
i = 30;
theta_t0 = 60;
%for t = 0:10:10000
for t = 330
    [r,v] = PosVelOrbit(r_lmo, gamma, i, theta_t0, t);
    figure(1);
    plot(t,r(1),'.');
    plot(t,r(2),'.');
    plot(t,r(3),'.');
    hold on;
    figure(2);
    plot(t,v(1),'.');
    plot(t,v(2),'.');
    plot(t,v(3),'.');
    hold on;
%     figure(3);
%     plot(r(2),r(3),'.');
%     hold on;
end
hold off;
