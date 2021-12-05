
%Drinking with substantial meal for women 
function dull_dizzy_dead
global k1 k2 k3 Climit ;
k1=6; k2=3; k3=0.019; Climit=0.05;

tend= 6; %end time in hours

% 4 drinks C10=0.136; 3 drink c10=0.102, 2 drinks C10 =0.068,
%1 drink C10=0.034
C10=0.102; C20=0; u0 = [C10; C20];

%ode solution
[tsol, usol] = ode45(@rhs, [0, tend], u0);
C1sol = usol(:,1);
C2sol = usol(:,2);



%made a plot
plot(tsol, C1sol,'k'); hold on
plot(tsol, C2sol,'r:'); hold off
legend('GI-tract', 'BAL Bloodstream')
xlabel('time in hours')
ylabel('BAL in (g/100ml)')
title(' Woman drinking with subtantial meal')

%create funtion
function dcdt = rhs(t, u)
global k1 k2 k3
M=double(0.005);
C1 = u(1); C2=u(2);
C1dot =-k1*C1;   %I=(n/t)*cs
C2dot = k2*C1 - (k3*C2/(C2+M));
dcdt = [C1dot; C2dot];