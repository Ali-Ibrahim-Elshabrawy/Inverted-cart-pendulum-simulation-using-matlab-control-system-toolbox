%% Defining My System Paramters and substituiting it into my symbolic matrices A,B
clc , close all

[A,B] = Find_A_and_B(1,5,2,10,0.2,'d')

%%  Checking the observability of my system by checking each parameters available that i can measure

C = [1 0 0 0];      %Measuring x
%C = [0 1 0 0];      %Measuring xdot
%C = [0 0 1 0];      %Measuring theta
%C = [0 0 0 1];      %Measuring thetadot

rank(obsv(A,C))         %If my rank was 4 then my system is observable 
%Observable system means i can fully estimate my system state from my
%limited measurements

%%  Which measurements are best if we omit "x" 
%If i omit x i only need the down 3x3 matrix from A and the down 3x1 matrix
%from B
A = A(2:end,2:end);
B = B(2:end);
%%
% C = [1 0 0];
C = [0 1 0];
% C = [0 0 1];
obsv(A,C)
rank(obsv(A,C))
D = zeros(size(C,1),size(B,2));
sys = ss(A,B,C,D);
det(gram(sys,'o'))          %I use this to determine the degree of observability of my system
[u,s,v] = svd(gram(sys,'o'))