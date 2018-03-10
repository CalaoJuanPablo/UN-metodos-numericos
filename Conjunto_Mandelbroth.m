clc; clear all; close all;
%Conjunto de mandelbroth

puntos=input('Número de puntos: ');
puntosx=linspace(-2.1,0.9,puntos);
puntosy=linspace(-1.5,1.5,puntos);
[X,Y]=meshgrid(puntosx,puntosy);
C=X+Y*i;
Z=zeros(puntos);
iteraciones=input('Número de iteraciones: ');

for k=1:iteraciones
    Z=Z.^2+C;
    W=exp(-abs(Z));
end
pcolor(W)