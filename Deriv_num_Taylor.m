%Derivacion Numerica Taylor
clc; clear all;
syms x
f=input('Digite la función F(x): ');
set(ezplot(f),'color','blue'); hold on;
x0=input('Digite el valor de x_0: ');

h=1;
H(1)=h;
D(1)=(-subs(f,x,x0+2*h+8*subs(f,x,x0+h)-8*subs(f,x,x0-h)+subs(f,x,x0-2*h))/(12*h));
E(1)=0;

for n=1:4
    h=h/10;
    H(n+1)=h;
    D(n+1)=(-subs(f,x,x0+2*h+8*subs(f,x,x0+h)-8*subs(f,x,x0-h)+subs(f,x,x0-2*h))/(12*h));
    E(n+1)=abs(D(n+1)-D(n));
end

disp('Primera columna: valor de h.')
disp('Segunda columna: Derivada de F(x) en x0.')
disp('tercera columna: Error Absoluto')
%L=[H' D' E']
disp('La derivada es: ')
m=D(n+1)
plot(x0,subs(f,x,x0),'Ok'); hold on;
%b=subs(f,x,x0)-m*x0;
%Y=m*x+b;
%set(ezplot(Y),'color','m'); hold on;
%ylim([-50,50])