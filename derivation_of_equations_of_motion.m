 %clear all, close all, clc
 %Evaluating Equations of motion 
 syms x u T theta dtheta ddtheta m M L g d dx 
 eq1 = -T*sin(theta) + u -M*(d*dx +x);
 eq1 = expand(eq1);
 eq2 = T*sin(theta) -m*(x-L*ddtheta*cos(theta)+L*(dtheta^2)*sin(theta));
 eq2 = expand(eq2);
 eq3 = T*cos(theta)-m*g -m*(L*ddtheta*sin(theta)+L*dtheta^2*cos(theta));
 eq3 = expand(eq3);
 eq4 = eq1 + eq2;
 eq5 = solve(eq4 == 0,x); %this is x
 x = eq5;
 eq6 = eq2*cos(theta)-eq3*sin(theta);
 eq6 = subs(eq6,x);
 eq7 = solve(eq6==0,ddtheta);
 eq7 = expand(eq7);
 eq7 = simplify(eq7);
 x = subs(eq5,ddtheta,eq7);
 ddtheta = eq7;
if (s == 1) 
 xo = [0 0 0 0];
else
 xo = [0 0 pi 0];
end
 %This evaluated partial derivative of x double dot with respect to xdot
dx_dx = diff(x,dx); 
dx_dx = subs(dx_dx,dx,xo(2));
dx_dx = subs(dx_dx,dtheta,xo(4));
dx_dx = subs(dx_dx,theta,xo(3));
dx_dx = simplify(dx_dx);
%This evaluated partial derivative of x double dot with respect to theta
dx_dtheta = diff(x,theta); 
dx_dtheta = subs(dx_dtheta,dx,xo(2));
dx_dtheta = subs(dx_dtheta,dtheta,xo(4));
dx_dtheta = subs(dx_dtheta,theta,xo(3));
dx_dtheta = simplify(dx_dtheta);
 %This evaluated partial derivative of theta double dot with respect to x
 %dot
dddtheta_ddx = diff(ddtheta,dx);
dddtheta_ddx = subs(dddtheta_ddx,dx,xo(2));
dddtheta_ddx = subs(dddtheta_ddx,dtheta,xo(4));
dddtheta_ddx = subs(dddtheta_ddx,theta,xo(3));
dddtheta_ddx = simplify(dddtheta_ddx);
 %This evaluated partial derivative of theta double dot with respect to
 %theta
dddtheta_dtheta = diff(ddtheta,theta);
dddtheta_dtheta = subs(dddtheta_dtheta,dx,xo(2));
dddtheta_dtheta = subs(dddtheta_dtheta,dtheta,xo(4));
dddtheta_dtheta = subs(dddtheta_dtheta,theta,xo(3));
dddtheta_dtheta = simplify(dddtheta_dtheta);
 %This evaluated partial derivative of x double dot with respect to u
dx_du = diff(x,u);
dx_du = subs(dx_du,dx,xo(2));
dx_du = subs(dx_du,dtheta,xo(4));
dx_du = subs(dx_du,theta,xo(3));
dx_du = simplify(dx_du);
 %This evaluated partial derivative of theta double dot with respect to u
dddtheta_du = diff(ddtheta,u);
dddtheta_du = subs(dddtheta_du,dx,xo(2));
dddtheta_du = subs(dddtheta_du,dtheta,xo(4));
dddtheta_du = subs(dddtheta_du,theta,xo(3));
dddtheta_du = simplify(dddtheta_du);

clear eq1 eq2 eq3 eq4 eq5 eq6 eq7 T x ddtheta   %Clear unnecessary symbolic variables

A = [0 1 0 0 ; 0 dx_dx dx_dtheta 0 ; 0 0 0 1 ; 0 dddtheta_ddx dddtheta_dtheta 0];
A;
B = [ 0; dx_du; 0; dddtheta_du];
B;
clear dx_dx dx_dtheta dddtheta_ddx dddtheta_dtheta dx_du dddtheta_du  %Clear unnecessary symbolic variables