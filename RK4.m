function x = RK4(xdot_func, x_t, u_t, t, dt)
k1 = feval(xdot_func, x_t, u_t, t);
x1 = x_t+k1*dt/2;
k2 = feval(xdot_func, x1, u_t, t+dt/2);
x2 = x_t+k2*dt/2;
k3 = feval(xdot_func, x2, u_t, t+dt/2);
x3 = x_t+k3*dt;
k4 = feval(xdot_func, x3, u_t, t+dt);

x = x_t + (k1+2*k2+2*k3+k4)*dt/6;
end
