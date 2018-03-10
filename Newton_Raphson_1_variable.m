clc; clear all;
syms x  
f=input('Digita la función f: ');
Xk=input('Digita el valor semilla : ');
tol=input('Digita tolerancia: ');
if(isempty(tol))
    tol=10^(-5);
end
df=diff(f);
for i=1:100
    Xk1=Xk-((subs(f,x,Xk)/subs(df,x,Xk)));
    error=abs(Xk1-Xk);
    N(i,1)=i-1;
    N(i,2)=Xk;
    N(i,3)=Xk1;
    N(i,4)=error;
    
    if (error<=tol)
        break;
    else 
        Xk=Xk1;
    end
end
if (i==100)
       disp('metodo no converge, cambie la semilla' )
else 
       format long
       disp( ' la raiz es= '); disp(Xk1)
end
   disp(N)
