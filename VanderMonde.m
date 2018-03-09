clear all;
clc;
sw=1;
syms x;

while(sw)
    X= input('Digite el vector de Coordenadas en X: \n');
    Y= input('Digite el vector de Coordenadas en Y: \n');
    sw=length(X)~=length(Y);
end

plot(X,Y,'Or');
x=[min(X):0.01:max(X)];
M=vander(X);

C= M\Y';

hold on;
plot(x,polyval(C,x));
