function u = PD(sigma_BR,wB_BR)
P = 0.7;
K = 0.1;
u = -K*sigma_BR - P*wB_BR;
end
