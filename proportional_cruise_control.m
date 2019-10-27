clear all, close all, clc

t = 0:0.1:10;       % time
wr = 60 + 0*t;      % reference speed
d = 1*sin(pi*t);

aModel = 2;         % y = aModel*u
aTrue = 1;          % y = aTrue*u

uOL = wr/aModel;    % open-loop u based on model
yOL = aTrue*uOL + d;% Open-loop response

k = 10;             % control gain, u = k(wr-y)    change it and see the response
yCL = (aTrue*k/(1+aTrue*k))*wr + d/(1+aTrue*k);   %closed loop response of my system

plot(t,wr,'k','LineWidth',2)
hold on
plot(t,yOL,'r','LineWidth',2)
plot(t,d,'--','LineWidth',2)
plot(t,yCL,'b','LineWidth',2)
ylim([-20 70])
xlim([0 10])
legend ('referene speed','open loop','disturbance','closed loop')