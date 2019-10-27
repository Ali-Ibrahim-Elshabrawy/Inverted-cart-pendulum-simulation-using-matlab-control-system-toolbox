clear all, close all, clc

% create a car model

sysCar_OL = ss(-1,1,1,0);           %My open loop state space system

% Converting my ss to tf by 2 commands below
[num,den] = ss2tf(sysCar_OL.a,sysCar_OL.b,sysCar_OL.c,sysCar_OL.d); 
tfCar_OL = tf(num,den);

 s = tf('s');
% tfCar_OL = 1/(s+1) ;

DesiredLoop = 10/s;
K = DesiredLoop/tfCar_OL;

tfCar_OL = 1/(s+0.5);          % Imagine if my actual system is different from modeled on (uncertainties)

sysLoop = series(K,sysCar_OL); % It tells matlab that my K and open loop system of the car are in series
sysCL = feedback(sysLoop,1,-1); %Make a feedback system with (r-ym)

step(sysCL)                    % Draw the response to a step input for closed loop system
hold on
step(sysCar_OL)                 % Draw the response to a step input for open loop system
legend('closed loop','Open loop')

