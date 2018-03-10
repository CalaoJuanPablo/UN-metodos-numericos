% condiciones iniciales

% enviar datos iniciales
vo=15;
thetha=30;
x1o=0;
x2o=0;
x3o=15*cos(thetha*pi/180);
x4o=15*sin(thetha*pi/180);

[t,y]=ode45(@labsolu,[0,2],[x1o x2o x3o x4o]);

xp=y(:,1);
yp=y(:,2);
vx=y(:,3);
vy=y(:,4);

