function [dthetadt] = equm(t,thetaa)
% theta=thetaa;
global lambda sigma theta

dthetadt = lambda/sigma*exp(-1/theta) - 1/sigma*(theta - thetaa);
end

