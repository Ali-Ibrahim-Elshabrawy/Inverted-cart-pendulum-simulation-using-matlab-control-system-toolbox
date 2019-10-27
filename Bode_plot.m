
%% This command tells matlab that take s to be my transfer function symbol
%It looks like it only takes 's' as a variable and doesn't take any other symbol
s = tf('s')  ;   

%% In this section we create our transfer function and draw its response
G = 1/(s^2+s+1); %This is my Transfer function

bode(G)     %This draws the bode diagram of my system
figure      %Create a new figure so i can draw other graphs on it
impulse(G)  %Plot the impulse response of my system
figure
step(G)     %plot the step response of my system
