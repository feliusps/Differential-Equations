
%Use Maple or MATLAB to replicate the results in the case study, 
%for both constant and seasonal flow and constant and seasonal pollution
%concentrations entering the lake. Comment on the solutions


function lake_burley  %Constant flow Seasonal concentration

%set global variables
global F V cin % F = flow, V = volume, cin = pollution enter the lake. 
N = 100; % set of point to be represented
% t = time

%Pollution levels in Lake Burley Griffin over time with
%constant rates of flow and pollution

                  % c0 > cin
cin = 3.01*10^6 ; V = 28*10^6; F = 4*10^6; c0 = 3.1*10^6; tend = 100;
t = linspace(0,1,N);
[tsol, ysol] = ode45( @derhs, [0, tend], c0 );

cin = 3.02*10^6 ; V = 28*10^6; F = 4*10^6; c0 = 3.3*10^6; tend = 100;
t = linspace(0,1,N);
[tsol1, ysol1] = ode45( @derhs, [0, tend], c0 );

cin = 3.03*10^6; V = 28*10^6; F = 4*10^6; c0 = 3.5*10^6; tend = 100;
t = linspace(0,1,N);
[tsol2, ysol2] = ode45( @derhs, [0, tend], c0 );

cin = 3.04*10^6; V = 28*10^6; F = 4*10^6; c0 = 3.7*10^6; tend = 100;
t = linspace(0,1,N);
[tsol3, ysol3] = ode45( @derhs, [0, tend], c0 );

cin = 3.05*10^6; V = 28*10^6; F = 4*10^6; c0 = 3.9*10^6; tend = 100;
t = linspace(0,1,N);
[tsol4, ysol4] = ode45( @derhs, [0, tend], c0 );


    % cin > c0
cin = 2.95*10^6 ; V = 28*10^6; F = 4*10^6; c0 = 2.1*10^6; tend = 100;
t = linspace(0,1,N);
[tsol5, ysol5] = ode45( @derhs, [0, tend], c0 );

cin = 2.97*10^6 ; V = 28*10^6; F = 4*10^6; c0 = 2.3*10^6; tend = 100;
t = linspace(0,1,N);
[tsol6, ysol6] = ode45( @derhs, [0, tend], c0 );

cin = 2.98*10^6; V = 28*10^6; F = 4*10^6; c0 = 2.5*10^6; tend = 100;
t = linspace(0,1,N);
[tsol7, ysol7] = ode45( @derhs, [0, tend], c0 );

cin = 2.99*10^6; V = 28*10^6; F = 4*10^6; c0 = 2.7*10^6; tend = 100;
t = linspace(0,1,N);
[tsol8, ysol8] = ode45( @derhs, [0, tend], c0 );

cin = 3.0*10^6; V = 28*10^6; F = 4*10^6; c0 = 2.9*10^6; tend = 100;
t = linspace(0,1,N);
[tsol9, ysol9] = ode45( @derhs, [0, tend], c0 );


%set axis to the center of plot
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on

%plot cin > c0  and cin < c0
hold on
plot(tsol, ysol,tsol1, ysol1,tsol2,ysol2,tsol3, ysol3,tsol4,ysol4,...
 tsol5, ysol5,tsol6, ysol6,tsol7,ysol7,tsol8, ysol8,tsol9,ysol9)
xlabel('time in months')
ylabel('C(t) (10^7 parts/m^3)')
title(' Costant flow and Seasonal Concetration')




function ydot = derhs(t, c)
global F V cin %set global variables
ydot = F/V*(cin - c);