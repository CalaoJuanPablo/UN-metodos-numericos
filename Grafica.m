%% Inicialización
clc;
clear all;
syms x;

%% Primera Grafica
f= inline('x.^2');
X= -10:0.01:-5;
Y=f(X);
plot(X,Y,'-m');
hold on
%% Segunda Grafica

f= inline('abs(x)');
X= -5:0.01:5;
Y=f(X);
plot(X,Y,'-y');
hold on

%% Tercera gráfica
f= ((x-7)^2 -9)^(1/2);
X= 5:0.01:11;
Y=subs(f,x,X);
plot(X,Y,'-g');
hold on
