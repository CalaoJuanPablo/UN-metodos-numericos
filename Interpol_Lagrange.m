%Polinomio de Interpolacion de Lagrange

clc; clear all; close all; syms x;
X=input('Digite los valores de x: ');
Y=input('Digite los valores de y: ');

n=length(X);
polinom=0;

for j=1:n
    k=1;
    for i=1:n
        if i~=j
            k=k*(x-X(i))/(X(j)-X(i));
        end
    end
    polinom=polinom+k*Y(j);
end

for i=1:n
    plot(X(i),Y(i),'Ok')
    hold on
end
disp('Este es el Polinomio')
disp(polinom)
set(ezplot(polinom),'color','red'); grid on; hold on;