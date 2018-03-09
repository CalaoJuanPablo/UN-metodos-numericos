    
clc;clear all; syms x;
f=input('Digita la función f: ');
ezplot(f);  grid on; hold on;
tol=input('Digita tolerancia:');
if(isempty(tol))
    tol=10^(-5);
end
Xk=input('primer punto: ');
Xk1=input('segundo punto: ');
% error=1;
% k=3;
% P(1)=p0;
% P(2)=p1;
for i=1:150
    Xk2=Xk1-((Xk1-Xk)*(subs(f,x,Xk1))/(subs(f,x,Xk1)-subs(f,x,Xk)));
    error=abs(Xk2-Xk1);
    N(i,1)=i-1;
    N(i,2)=Xk;
    N(i,3)=Xk1;
    N(i,4)=Xk2;
    N(i,5)=error;
    
    if (error<=tol)
        break;
    else 
        format longer
        Xk=Xk1;
         Xk1=Xk2;
    end
end
disp(N)
    
 disp(['La raiz es: ',num2str(Xk2)]);
 
 plot(Xk2,0,'Ob');