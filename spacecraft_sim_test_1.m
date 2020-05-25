% Initial Condition
x0 = [0.3;-0.4;0.5;deg2rad(1.0);deg2rad(1.75);deg2rad(-2.2)];
u = [0;0;0];
%u = [0.01;-0.01;0.02];


dt = 1;                   % Time step
t_start = 0;
t_final = 499;
t = t_start:dt:t_final;

x_data = [];
j = 1; % for data collection indexing
xstar = x0;           % Initial condition gives solution at t=0.
for i=t
    xstar = RK4("MAVERICK", xstar, u, i, h);
    x_data(1,j) = xstar(1,1);
    x_data(2,j) = xstar(2,1);
    x_data(3,j) = xstar(3,1);
    x_data(4,j) = xstar(4,1);
    x_data(5,j) = xstar(5,1);
    x_data(6,j) = xstar(6,1);
    j = j + 1;
end
plot(t,x_data);
legend('sigma_1', 'sigma_2', 'sigma_3', 'w_1', 'w_2', 'w_3');

I_b = [10,0,0; 0,5,0; 0,0,7.5]; % Kg*m^3 

% AT 500 sec

% angular vel in B -frame
H_b = I_b*xstar(4:6,1)

% rotational kinetic energy
T = 0.5*(xstar(4:6)')*I_b*xstar(4:6)

% angular vel in N-frame
BN = mrp2dcm(xstar(1:3));
H_n = BN' * H_b
