clear all , clc 
%close all   %Closes all opened figures

m =1;
M=5;
L=2;
g=10;
d=1;

tspan = 0:0.1:10;
y0 = [0,1,pi,0.2];
[t,y] = ode45(@(t,y)My_cartpend(y,m,M,L,g,d,0),tspan,y0);
for k=1:length(t)
   My_drawcartbend(y(k,:),m,M,L);
end