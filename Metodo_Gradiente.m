clc;clear all;
syms x;
f=input('digite la funcion: ');
t=inline(f);
ezplot(t);hold on;
Xk=input('digite el valor inicial: ');
tol=input('presione enter para usar tolerancia por defecto sino digite la tolerancia: ');
if(isempty(tol))
    tol=10^(-5);
end
g=gradient(t(x));
alfa=0.1;
for i=1:100
 Xk1=Xk-alfa*subs(g,x,Xk);
 if abs(Xk1-Xk)<=tol
 break
 else 
     Xk=Xk1;
end
end
if i==100
    disp('cambie de semilla ');
else
    disp('El minimo es: '); disp(Xk1)
    plot(Xk1,f(Xk1),'Om');
end