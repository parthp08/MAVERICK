% Solve y'(t)=-2y(t) with y0=3, 4th order Runge Kutta
y0 = 3;                  % Initial Condition
h=0.1;                   % Time step
t = 0:h:20;               % t goes from 0 to 2 seconds.
yexact = 3*exp(-2*t)     % Exact solution (in general we won't know this
ystar = zeros(size(t));  % Preallocate array (good coding practice)

ystar(1) = y0;           % Initial condition gives solution at t=0.
for i=1:(length(t)-1)
    ystar(i+1) = RK4("ydot_rk4_test", ystar(i), i, h);
end
plot(t,yexact,t,ystar);
legend('Exact','Approximate');