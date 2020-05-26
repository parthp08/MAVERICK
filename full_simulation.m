clear all;
clc;

% Initial Condition => sigma_BN, wB_BN
x0 = [0.3;-0.4;0.5;deg2rad(1.0);deg2rad(1.75);deg2rad(-2.2)];
u = [0;0;0];

dt = 1;                   % Time step
t_start = 0;
t_final = 7500;
t = t_start:dt:t_final;

lmo_pos_data = [];
gmo_pos_data = [];

x_data = [];
u_data = [];
j = 1; % for data collection indexing
xstar = x0;           % Initial condition gives solution at t=0.

for i=t
    
    % current orbit state of the  both spacecraft % in n-frame
    [r_gmo,~] = PosVelOrbit(20424.2,0,0,250,i);
    [r_lmo,~] = PosVelOrbit(3.7962e+03,20,30,60,i);
     angle_between_2 = angle_between_two_vec(r_gmo,r_lmo);

     lmo_pos_data(1,j) = r_lmo(1);
     lmo_pos_data(2,j) = r_lmo(2);
     lmo_pos_data(3,j) = r_lmo(3);
     gmo_pos_data(1,j) = r_gmo(1);
     gmo_pos_data(2,j) = r_gmo(2);
     gmo_pos_data(3,j) = r_gmo(3);
     
    % Pointing 
    % if its in shadow, then nadir or communication mode(if in 35deg cone)
    % else solar charging mode
    if i == 0 % nadir pointing at t = 0
        RN = RnN_t(i);
        wN_RN = wN_RnN(i);
        disp("nadir mode");
    elseif r_lmo(2) < 0 % in shadow
        if angle_between_2 < deg2rad(35) % communication mode
            RN = RcN_t(i);
            wN_RN = wN_RcN(i);   
            disp("communication mode");
        else % nadir pointing
            RN = RnN_t(i);
            wN_RN = wN_RnN(i);
            disp("nadir mode");
        end
    else % sun pointing % +ve r_lmo(2) 
        RN = RsN();
        wN_RN = [0.0;0.0;0.0];
        disp("solar charging mode");
    end
        
    [sigma_BR,wB_BR] = AttitudeError(0,xstar(1:3),xstar(4:6),RN,wN_RN);
    u = PD(sigma_BR,wB_BR);
    xstar = RK4("MAVERICK", xstar, u, i, dt);
    x_data(1,j) = xstar(1,1);
    x_data(2,j) = xstar(2,1);
    x_data(3,j) = xstar(3,1);
    x_data(4,j) = xstar(4,1);
    x_data(5,j) = xstar(5,1);
    x_data(6,j) = xstar(6,1);
    u_data(1,j) = u(1);
    u_data(2,j) = u(2);
    u_data(3,j) = u(3);
    j = j + 1;
end
figure(1);
plot(t,x_data(1:3,:));
legend('sigma_1', 'sigma_2', 'sigma_3', 'w_1', 'w_2', 'w_3');

% control effort
figure(2);
plot(t,u_data);

% plot the lmo and gmo trajectory
figure(3);
plot3(lmo_pos_data(1,:),lmo_pos_data(2,:),lmo_pos_data(3,:))
hold on;
plot3(gmo_pos_data(1,:),gmo_pos_data(2,:),gmo_pos_data(3,:))

