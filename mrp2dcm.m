function C = mrp2dcm(q)
q_n = norm(q);
q_t = tilde_matrix(q);
C = eye(3) + (8*q_t^2 -4*(1-q_n^2)*q_t)/(1+q_n^2)^2;
end
