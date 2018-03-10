% Busqueda Aurea
clc; clear all; close all;
syms x 
f=input('Digita la función f: ');
set(ezplot(f),'color','r'); hold on;
a=input('Digita valor inicial: ');
b=input('Digita valor final: ');
e=input('Digita e: ');
if(isempty(e))
    e=10^(-5);
end
 K=(-1+sqrt(5))/2;
 B=K*(a-b);
 x1=a-B;
 x2=b+B;
 Y1=subs(f,x,x1); 
       Y2=subs(f,x,x2);
 while (abs(a-b)>e)
    
B=K*B;
       if (Y1>Y2)
           a=x2; x2=x1;
           x1=a-B;Y2=Y1; 
           Y1=subs(f,x,x1);
       else
           if (Y1<Y2)
               b=x1; x1=x2; 
               Y1=Y2; x2=b+B;
               Y2=subs(f,x,x2);
           else 
               b=x1; a=x2; 
               x2=a-B; x1=b+B;
               Y1=subs(f,x,x1);Y2=subs(f,x,x2);
           end
       end
 end

 if Y1>Y2
    Xmax=x2;fx=Y2;
    disp('el optimo esta en:');disp(Xmax);
    hold on; plot(Xmax,subs(f,x,Xmax),'Ok');
  else
    xmax2=x1;fx2=Y1; 
    disp('el optimo esta en:');disp(xmax2);
    hold on; plot(xmax2,subs(f,x,xmax2),'Ok');
 end
