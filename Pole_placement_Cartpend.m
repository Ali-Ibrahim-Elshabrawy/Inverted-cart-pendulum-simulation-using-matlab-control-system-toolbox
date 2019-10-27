%clc , close all
H = [1 5 2 10 0.2 ] %H = [m M L g d]
[A,B, s] = Find_A_and_B(H(1),H(2),H(3),H(4),H(5),'u');
eig(A)
rank(ctrb(A,B))  % is it controllable

%%  Pole placement

% p is a vector of desired eigenvalues
%p = [-.01; -.02; -.03; -.04]; % not enough
% p = [-.3; -.4; -.5; -.6];  % just barely
p = [-1; -1.1; -1.2; -1.3]; % good
%p = [-3; -3.1; -3.2; -3.3]; % aggressive
%p = [-3.5; -3.6; -3.7; -3.8]; % breaks
K = place(A,B,p);
% K = lqr(A,B,Q,R);

tspan = 0:.001:15;
if(s==1)
    y0 = [0; 0; 0; 0];
    [t,y] = ode45(@(t,y)My_cartpend(y,H(1),H(2),H(3),H(4),H(5),-K*(y-[4; 0; 0; 0])),tspan,y0);
elseif(s==-1)
    y0 = [-3; 0; pi+.1; 0];
%     [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[1; 0; pi; 0])),tspan,y0);
    [t,y] = ode45(@(t,y)My_cartpend(y,H(1),H(2),H(3),H(4),H(5),-K*(y-[4; 0; pi; 0])),tspan,y0);
else 
end

for k=1:100:length(t)
    My_drawcartbend(y(k,:),H(1),H(2),H(3));
end

