%Polinomio de aproximacion de Taylor

clc; clear all;
syms x
f=input('Digite la función F(x) a aproximar: ');
%x0=input('Digite el punto x0= ');
for k=0:10
    ezplot(f);axis([-8,8,-1.5,1.5]);
    hold on;
    t=taylor(f,x,'order',k);
    set(ezplot(t),'color','red');axis([-5,3,-4,8]);pause(1)
    hold off;  
end