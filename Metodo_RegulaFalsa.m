
clc; clear all; syms x;

f=input('digite la funcion: ');
ezplot(f); grid on;hold on;
a=input('digite el limite inferior:');
b=input('digite el limite superior:');
tol=input('digite la tolerancia:');
if(isempty(tol))
    tol=10^(-5);
end
while(abs(a-b)>tol)
        Ya=subs(f,x,a);
        Yb=subs(f,x,b);
        c=b-(Yb*(a-b))/(Ya-Yb);
        Yc=subs(f,x,c);
        if subs(f,x,c)==0
            tol=abs(b-a);
        else
            if (Ya*Yb<0)
                b=c;
            else
                a=c;
            end
       
        end
       
end
    disp('La raiz es: '); disp(c);
    hold on
    plot(c,subs(f,x,c),'Or');