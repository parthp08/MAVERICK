function q = dcm2mrp(C)
b = dcm2quat(C);
q(1) = b(2)/(1+b(1));
q(2) = b(3)/(1+b(1));
q(3) = b(4)/(1+b(1));
end