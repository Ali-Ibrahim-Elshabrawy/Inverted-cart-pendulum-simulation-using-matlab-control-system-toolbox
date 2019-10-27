function My_drawcartbend(y,m,M,L)
%This function takes my cartpend parameters and Draws a simulation for it

%Defining The Value of x and theta that are in state space
x  = y(1);
th = y(3);
wd  = 0.2;           %Defining the wheel radius
%Plot general Plot from -10 to 10 in x-axis and -1 to 1 in y-axis
plot([-10 10],[0 0],'w','LineWidth',2)
hold on
%Drawing the Rectangular cart
W = 1+sqrt(M/5);     %Defining the Width of the cart as a function of M 
H = 0.5*sqrt(M/5);   %Defining the Hight of the cart as a function of M
y = wd/2 + H/2;      %Defining the y position of the cart = wheel diameter/2 + Height/2 
rectangle('Position',[x-W/2,y-H/2,W,H],'Curvature',0.1,'FaceColor','r','EdgeColor','y') %Draw My Rectangular cart
%Drawing the wheels of the cart
w1x = x - 0.8*W/2;   %Defining wheel 1 x-position
w1y = wd/2;             %Defining whee1 1 y-position
w2x = x + (0.8*W/2);   %Defining wheel 2 x-position
w2y = wd/2;             %Defining wheel 2 y-position
rectangle('Position',[w1x-wd/2,w1y-wd/2,wd,wd],'Curvature',1,'FaceColor','y','EdgeColor','b') %Draw wheel 1
rectangle('Position',[w2x-wd/2,w2y-wd/2,wd,wd],'Curvature',1,'FaceColor','y','EdgeColor','b') %Draw wheel 2
%Drawing the Pendulum
Pd = 0.3*sqrt(m);    %Defining the Diameter of the pendulum
Px = x - L*sin(th);  %Defining x-position of the pendulum center
Py = y - L*cos(th);  %Defining y-position of the pendulum center
rectangle('Position',[Px-Pd/2,Py-Pd/2,Pd,Pd],'Curvature',[1,1],'FaceColor','b','EdgeColor','r') %Draw Pendulum
plot([x Px],[y Py],'w','LineWidth',2) %Draw a Line between cart center and Pendulum Center
%Setting plot and Figures colors
set(gca,'Color','k','XColor','w','YColor','w')  %Set plot background color to be black and axes color to be white
set(gcf,'Color','k')                            %Set out figure of the plot to be black
xlim([-5 5]);                                   %To make x and y always fixed at a particular limit
ylim([-2 2.5]);
drawnow                                         %This updates your plot function
hold off