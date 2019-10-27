function dy = My_cartpend(y,m,M,L,g,d,u)
dx = y(2);
theta = y(3);
dtheta = y(4);

dy(1,1) = y(2);
dy(2,1) = -(M*d*dx - u + (m*cos(theta)*(L*m*cos(theta)*sin(theta)*dtheta^2 - u*cos(theta) + g*m*sin(theta) + M*g*sin(theta) + M*d*dx*cos(theta)))/(M + m - m*cos(theta)^2) + L*dtheta^2*m*sin(theta))/(M + m);
dy(3,1) = y(4);
dy(4,1) = -(L*m*cos(theta)*sin(theta)*dtheta^2 - u*cos(theta) + g*m*sin(theta) + M*g*sin(theta) + M*d*dx*cos(theta))/(L*(M + m - m*cos(theta)^2));