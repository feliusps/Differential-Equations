% MATLAB for ploting of heat loss and heat gain

%variables declaration
theta = 0.0:.001:2;
theta_a = 0.11;
theta_b = 0.19;
theta_c = 0.27;
yin = exp(-1./theta);

%different values of theta
%theta = 0.11
youta = (theta.^2 - theta_a);
%theta = 0.19
youtb = (theta.^2 - theta_b);
%theta = 0.27
youtc = (theta.^2 - theta_c);


%set axis to the center of plot
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on

%plot spontaneus combustion bifurcation points
hold on
plot(theta,yin,'r', theta,youta,'b',theta,youtb,'g ',theta,youtc,'k' )
xlabel('theta')
ylabel('heat in and out)')
title(' graphical solution')


