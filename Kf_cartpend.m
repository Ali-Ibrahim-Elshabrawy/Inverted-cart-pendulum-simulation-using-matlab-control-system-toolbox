%% Defining My System Paramters and substituiting it into my symbolic matrices A,B
clc , close all
[A,B] = Find_A_and_B(1,5,2,10,0.2,'d');
%% Defining My measurements Parameters
C = [1 0 0 0];   %Here I measure my x-postion so my system becomes observable
Vd = 0.1*eye(4);    %Defining my disturbance covariance matrix
Vn = 1;             %Defining my noise covariance
B_AUG = [B Vd 0*B];  %Defining my input matrix for my system 
D_AUG = [0 0 0 0 0 Vn];   %Defining my Augmented D matrix for my measurements

sysC = ss(A,B_AUG,C,D_AUG);                     % build big state space system... with single output measurement
sysFullOutput = ss(A,B_AUG,eye(4),zeros(4,size(B_AUG,2)));  % system with full state output that measure (x,xdot,theta,thetadot), disturbance, no noise

%%  Build Kalman filter
[Kf,P,E] = lqe(A,Vd,C,Vd,Vn);  % design Kalman filter
%Kf = (lqr(A',C',Vd,Vn))';   % alternatively, possible to design using "LQR" code

sysKF = ss(A-Kf*C,[B Kf],eye(4),0*[B Kf]);  % Kalman filter estimator state spave model

%%  Estimate linearized system in "down" position (Gantry crane)
dt = .01;       %Time steps
t = 0:dt:50;    %Time span that I will solve my system in

uDIST = randn(4,size(t,2));     %Normal Distribution disturbance matrix
uNOISE = randn(size(t));        %Normal Distribution noise matrix
u = 0*t;                        %My input matrix
u(100:120) = 100;     % impulse from 1 sec to 1.2 sec
u(1500:1520) = -100;  % impulse from 15 sec to 15.2 sec

uAUG = [u; Vd*Vd*uDIST; uNOISE];    %My Augmented Input containging u,d,n

[y,t] = lsim(sysC,uAUG,t);              %Output from my state space model of my system where i measure only x
[xtrue,t] = lsim(sysFullOutput,uAUG,t); %Output from my state space model of my system where i measure only all of my states
[x,t] = lsim(sysKF,[u; y'],t);          %Output from my state space model of my Estimator where i measure all x_hat

plot(t,xtrue,'-',t,x,'--','LineWidth',2)

figure                                  %Creates new figure to draw the rest plotting we want on it
plot(t,y)   
hold on
plot(t,xtrue(:,1),'r')
plot(t,x(:,1),'k--')
