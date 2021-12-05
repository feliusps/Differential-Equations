function c_ht_sponcomp
global lambda sigma theta_a theta_b theta_c;
sigma = 1.0;
theta_a = 0.11;
theta_b = 0.19;
theta_c = 0.27;
tend = 300;
y0 = theta_a;
y1 = theta_b;
y2 = theta_c;
lambda = 2.2;
[tsol, ysol] = ode45(@rhs, [0 tend] , y0);
plot(tsol, ysol, '-.');
hold on;
lambda = 2.2;
[tsol, ysol] = ode45(@rhs, [0 tend] , y1);
plot(tsol, ysol, ':');
lambda = 2.2;
[tsol, ysol] = ode45(@rhs, [0 tend] , y2);
plot(tsol, ysol, '-');
axis([0, tend, 0, 2])

function thetadot = rhs(t, theta)
global lambda sigma theta_a ;
thetadot = lambda/sigma*exp(-1/theta) - 1/sigma*(theta - theta_a);