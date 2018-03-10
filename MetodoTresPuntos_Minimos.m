clc;
clear;

syms x
f=input('Digita la función f: ');
a=input('Digita valor inicial: ');
b=input('Digita valor final: ');
ezplot(f),'r';hold on;
e=input('Digita e: ');
if(isempty(e))
    e=10^(-5);
end

while(abs(a-b)>e)

    c=(a+b)/2;  
    X1=c-e/2; Y1=subs(f,x,X1);
    X2=c+e/2; Y2=subs(f,x,X2);
    if(Y1<Y2)
        b=X2;
    else
        if(Y1>Y2)
            a=X1;
        else
            a=X1;
            b=X2;
        end
    end
    if(abs(b-a)<=e)
        break;
    end
     
    
end
disp('El minimo esta en: ');disp(c); 

plot(c,subs(f,x,c),'Ob');

plot(c,subs(f,x,c),'Ob');