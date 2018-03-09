% Iteración de Punto Fijo

clc; clear all; close all;
syms t
m=input('Digite la masa del paracaidista ');
V=(9.8*m)/12.5*(1-exp(-(12.5/m)*t));
set(ezplot(V,[-10,100]),'color','r'); grid on; hold on
ylim([-10,70])
CAce=9.8-(12.5/m)*t;
Ace=9.8-(12.5/m)*t+t;
set(ezplot(CAce,[-10,100]),'color','b'); grid on; hold on
ylim([-10,70])
a=input('Digite el valor inicial: ');
i=input('Inserte el numero de iteraciones: ');

tol=input('Digita tol: ');
if(isempty(tol))
   tol=10^(-5);
end
for k=1:i;
   b=subs(Ace,t,a);
   if abs(b-a)<tol
       plot(b,subs(CAce,t,b),'Ok')
      break
   end 
   a=b;
end
if k==i
    disp('La funcion no converge, vuelva a correr el algoritmo con mas iteraciones ')
end 

disp('La raiz es: ');disp(b);