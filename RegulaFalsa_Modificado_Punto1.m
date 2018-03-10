%Regula Falsi Modificado
clear all; clc; close all
syms t;
m=input('Digite la masa del paracaidista ');
V=(9.8*m)/12.5*(1-exp(-(12.5/m)*t));
set(ezplot(V,[-10,100]),'color','r'); grid on; hold on
ylim([-10,70])
Ace=9.8-(12.5/m)*t;
set(ezplot(Ace,[-10,100]),'color','b'); grid on; hold on
ylim([-10,70])
a=input('Digite el limite inferior: ');
b=input('Inserte el limite superior: ');
tol=input('digite la tolerancia:');
if(isempty(tol))
    tol=10^(-5);
end

Ya=subs(Ace,t,a);
Yb=subs(Ace,t,b);

A=a;
YA=Ya;
for i=1:150
   c=((Yb*a)-(Ya*b))/(Yb-Ya);
   Yc=subs(Ace,t,c);
   if abs(A-c)<=tol
       disp('La raiz es ')
       disp(c)
       hold on;
       plot(c,subs(Ace,t,c),'Ok')
       break
   else
       if ((Ya*Yc)<0)
           b=c;
           Yb=Yc;
           if (YA*Yc>0)
               Ya=Ya/2;
           end
       else
           a=c;
           Ya=Yc;
           if (YA*Yc>0)
               Yb=Yb/2;
           end
       end
       A=c;
      YA=Yc;
   
       if(i==150)
           
           disp('Método no converge, cambie los limites')
       end
   end
end
    
    
