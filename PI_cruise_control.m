%%  Defining my state space system for open loop P controller PI controller
clear all, close all, clc
kp = 1;                     % Proportional gain controller
ki = 5;                    % Integral gain controller

% Create open loop car model

sysC_OL = ss(-1,1,1,0);

%Create proportioal closed loop car model

sysC_CL_P = ss(-1-kp,kp,1,0);

%Create PI closed loop car model

A = [-1-kp ki; -1 0];       % My system matrix
B = [kp ; 1];               % My input actuation matrix
C = [1 0];                  % My meassurements matrix
D = 0;                      % My input measurement actuation matrix

sysc = ss(A,B,C,D);

% Defining my time span and the input 

dt = 0.1;
t = [0:dt:50];              % My time span
r = 0*t;                    % My zero input
r (100:200) = 10*t(100:200);           % Make any input from t=10s to t=50s
r (201:400) = r(200);
r (401:501) = 0;
[y1,t] = lsim(sysC_OL,r,t); % Find response to my open loop system 
[y2,t] =lsim(sysC_CL_P,r,t);% Find response to my P closed loop system  
[y3,t] = lsim(sysc,r,t);    % Find response to my PI closed loop system
plot(t,r,'--')% Plot my input in time
hold on
plot(t,y1,'r','LineWidth',1)              % Plot my response of open loop system in time
plot(t,y2,'b','LineWidth',1)              % Plot my response of P closed loop system in time
plot(t,y3,'k','LineWidth',1)              % Plot my response of PI closed loop system in time
legend('Input','open loop','proportional controller','PI ccontroller')
%xlim ([0 50])               % Adjust the X-limits of my graph
%ylim ([-20 2500])            % Adjust the y-limits of my graph