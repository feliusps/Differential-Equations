%Felix F Feliu
%Chapter 7 Linearization Analisis
%Mathematical modeling with case studies 
%B barnes and G R Fulford
clc, clear all, close all

tspan = 0:0.01:10; % Define the time of study


% Define the parameters
b1 = 1.3;
c1 = 0.01;
a2 = 1;
c2 = 0.01;

% Define the equilibrium points
xs = a2/c2;
ys = b1/c1;

x0 = [160,150]; % Define the initial conditions (x,y)

% Solve for normal model
[t,x] = ode45(@(t,x)ODESolver(t, x), tspan, x0);

% Slve for linearized mode.
[t,x2] = ode45(@(t,x)ODESolver_Linearized(t, x), tspan, x0);

% Plot the response for both models
subplot(2,1,1)
plot(t, x(:,1), 'linewidth', 2)
hold on
plot(t, x2(:,1), 'r--', 'linewidth', 3)
grid on
xlabel('Time (s)')
ylabel('X(t)');
title('X(t) vs. time');
legend('Original', 'Linearized');

subplot(2,1,2)
plot(t, x(:,2), 'linewidth', 2)
hold on
plot(t, x2(:,2), 'r--', 'linewidth', 3)
ylabel('Y(t)');
title('Y(t) vs. time');
legend('Original', 'Linearized');
grid on

% Function used by ode45 for normal model
function df = ODESolver(t,var)

    beta1 = 1.3;
    c1 = 0.01;
    a2 = 1;
    c2 = 0.01;
    
    x = var(1);
    y = var(2);
    
    dxdt = x*(beta1 - c1*y);
    dydt = y*(-a2 + c2*x);
    
    df = [dxdt;dydt];
end

% Function used by ode45 linearized model
function df = ODESolver_Linearized(t, var)
    b1 = 1.3;
    c1 = 0.01;
    a2 = 1;
    c2 = 0.01;
    
    xs = a2/c2;
    ys = b1/c1;
    
    x = var(1);
    y = var(2);
    
    dxdt = xs*(b1-c1*ys) + (b1-c1*ys)*(x-xs) + (-xs*c1)*(y-ys);
    dydt = ys*(-a2 + c2*xs) + (c2*ys)*(x-xs) + (-a2 + c2*xs)*(y-ys); 
    
    df = [dxdt;dydt];
end