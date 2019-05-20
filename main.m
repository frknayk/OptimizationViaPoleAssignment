clc;
clear;

global Kp Ki 

syms s 

%% System Parameters
ts = 0.01 ;
OS = 0.05;

% Damping Ratio and Natural Frequency
zeta = (-log(OS/100)) / ( sqrt( pi.^2 + log( OS/100 ).^2 ) );
wn = 4 / (zeta * ts);
% Closed Loop TF
Ts = wn^2 / ( s^2 + 2*zeta*wn*s + wn^2 );
[num,den] = numden(Ts);
num = coeffs(num,'s','all');
den = coeffs(den,'s','all');
num = double(num);
den = double(den);

tic

initial= [0 0];
stepsize=[1 1];
stopsize=[1/2^10 1/2^10];

% Specify the cost function inside of 'cost.m'
Cost=@cost;

[xvar,Costvalue,iteration,stepsize]=HookeJeeves(initial, stepsize, stopsize,Cost);

toc

xvar(end,:)
Costvalue(end)