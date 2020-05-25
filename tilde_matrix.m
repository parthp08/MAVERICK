function A_t = tilde_matrix(q)
% return skew-symmatric matrix 
A_t = [0,-q(3),q(2); q(3),0,-q(1); -q(2),q(1),0];
end