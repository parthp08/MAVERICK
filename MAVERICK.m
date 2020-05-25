function xdot = MAVERICK(x,u,t)
% spacecraft dynamic equation using MRP
    I_b = [10,0,0; 0,5,0; 0,0,7.5]; % Kg*m^3
    I_b_inv = inv(I_b);
    sigma = x(1:3);
    sigma_n = norm(sigma);
    xdot(1:3,1) = 0.25*((1-sigma_n^2)*eye(3) + 2*tilde_matrix(x(1:3)) + 2*x(1:3)*x(1:3)')*x(4:6);
    xdot(4:6,1) = I_b_inv*(-tilde_matrix(x(4:6))*I_b*x(4:6) + u);
end
