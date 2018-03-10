%Regula Falsi Modificado
clear all; clc; close all
syms t
m=input('Digite la masa del paracaidista');
V=(9.8*m)/12.5*(1-exp(-(12.5/m)*t));
ezplot(V,[0,60]); grid on; hold on
a=input('Digite el limite inferior: ');
b=input('Inserte el limite superior: ');
tol=input('digite la tolerancia:');
if(isempty(tol))
    tol=10^(-5);
end

Ya=subs(V,x,a);
Yb=subs(V,x,b);

A=a;
YA=Ya;
for i=1:150
   c=((Yb*a)-(Ya*b))/(Yb-Ya);
   Yc=subs(V,x,c);
   if abs(A-c)<=tol
       disp('La raiz es ')
       disp(c)
       hold on;
       plot(c,subs(V,x,c),'Or')
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
    
    
