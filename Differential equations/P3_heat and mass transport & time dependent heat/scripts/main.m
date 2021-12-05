clc
clear all;
close all;
warning off

%% a
global lambda sigma theta
lambda=2.2;
sigma=1;
thetaa=0.11;
tend=300;
theta=thetaa;
[dthetadt]=ode45(@equm,[0 tend],thetaa);
asol=dthetadt.x;
bsol=dthetadt.y;
figure;
plot(asol,bsol,'r-','linewidth',2.5);
xlabel('t (secs)');
ylabel('theta(t)');

thetaa=0.19;
tend=300;
theta=thetaa;
[dthetadt]=ode45(@equm,[0 tend],thetaa);
asol=dthetadt.x;
bsol=dthetadt.y;
figure;
plot(asol,bsol,'r-','linewidth',2.5);
xlabel('t (secs)');
ylabel('theta(t)');

thetaa=0.27;
tend=300;
theta=thetaa;
[dthetadt]=ode45(@equm,[0 tend],thetaa);
asol=dthetadt.x;
bsol=dthetadt.y;
figure;
plot(asol,bsol,'r-','linewidth',2.5);
xlabel('t (secs)');
ylabel('theta(t)');
