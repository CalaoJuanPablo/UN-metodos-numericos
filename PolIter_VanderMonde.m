%Polinomio de interpolación Vander Monde
clc;clear all
puntos=input('Digite la matriz de puntos asi: [x_n,y_n] ');
x=puntos(:,1);
y=puntos(:,2);
a=vander(x)\y;
disp('los coeficientes del sistema son= ')
disp(a)
plot(x,y,'Ok')