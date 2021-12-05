function c_he_waterheater
global m c h S q us;
m=29.53; c=3000; h=24; S=0.575; q=0; us=5;
u0 = 15; %initial temperature
tend = 10*60^2; %end time in seconds
[tsol, Usol] = ode45(@rhs, [0 tend], u0);


%set axis to the center of plot
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on

%plot
hold on
plot(tsol/60^2, Usol); %plot for time in hours
xlabel('Time t in hours')
ylabel('Temperature °C')
title(' Temperature vs time')


function Udot = rhs(t, U)
global m c h S q us;
Udot = q/c/m - h*S/c/m*(U - us);