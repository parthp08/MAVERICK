I_b = [10,0,0; 0,5,0; 0,0,7.5]; % Kg*m^3
T = 100; % should be less than 120 sec
damp_ratio = 0.7071; % should be <=1 for critical/under-damp
I_norm = norm(I_b,inf);
P = 2*I_norm/T
K = (P^2)/(I_norm*damp_ratio)
