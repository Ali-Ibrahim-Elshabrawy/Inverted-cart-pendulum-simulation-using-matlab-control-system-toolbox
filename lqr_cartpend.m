%clc , close all
H = [1 5 2 10 0.2 ] %H = [m M L g d]
[A,B, s] = Find_A_and_B(H(1),H(2),H(3),H(4),H(5),'u');
eig(A)

rank(ctrb(A,B))  % is it controllable

%%  Pole placement
Q = [1 0 0 0 ; 0 1 0 0; 0 0 10 0; 0 0 0 100];
R = 1;
K = lqr(A,B,Q,R);

tspan = 0:.001:15;
if(s==1)
    y0 = [0; 0; 0; 0];
    [t,y] = ode45(@(t,y)My_cartpend(y,H(1),H(2),H(3),H(4),H(5),-K*(y-[4; 0; 0; 0])),tspan,y0);
elseif(s==-1)
    y0 = [-3; 0; pi+.1; 0.5];
%     [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[1; 0; pi; 0])),tspan,y0);
    [t,y] = ode45(@(t,y)My_cartpend(y,H(1),H(2),H(3),H(4),H(5),-K*(y-[4; 0; pi; 0])),tspan,y0);
else 
end

for k=1:100:length(t)
    My_drawcartbend(y(k,:),H(1),H(2),H(3));
end

