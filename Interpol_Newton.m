%Polinomio de Interpolación de Newton

clc;clear all;close all; syms x;
X=input('Digite los valores de x: ');
Y=input('Digite los valores de y: ');

n=length(X);
D=zeros(n);
D(:,1)=Y';
for j=2:n
    for k=j:n
        D(k,j)=(D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));
    end 
end
pol=D(1,1);
j=1;
for i=2:n 
    j=j*(x-X(i-1));
    pol=pol+D(i,i)*j;
end
for i=1:n
    plot(X(i),Y(i),'Ok')
    hold on
end
disp('Este es el Polinomio')
disp(pol)
set(ezplot(pol),'color','red'); grid on; hold on;