clc; clear all;
syms x
f=input('Digita la función f: ');
a=input('Digita valor inicial: ');
b=input('Digita valor final: ');
e=input('Digita e: ');
if(isempty(e))
    e=10^(-5);
end
if(subs(f,x,a)*subs(f,x,b)<0)
    while (abs(a-b)>e)
        c=(b+a)/2;
       if (subs(f,x,c)~=0)
           if((subs(f,x,a)*subs(f,x,c)<0))
               b=c;
           else
               a=c;
           end
       else
           e=abs(b-a);
       end
    end
    disp('raiz = '); disp( c)
else 
    disp( 'error')
end
