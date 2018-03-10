clc; clear all;
syms x y 
F=input('Digita el vector de funciones: ');
set(ezplot(F(1)), 'color', 'r'); hold on;
set(ezplot(F(2)), 'color', 'b')

Xk=input('Digite el vector semilla : ');
tol=input('Digita tolerancia: ');
if(isempty(tol))
    tol=10^(-5);
end
J=jacobian(F);

for k=1:100
    delta=-(subs(J,[x y], [Xk(1) Xk(2)]))\subs(F, [x y], [Xk(1) Xk(2)]);
    Xk1=Xk+delta;
    error=abs(Xk1-Xk);
%     N(k,1,1)=k-1;N(k,2,2)=Xk;N(k,3,3)=Xk1;N(k,4,4)=error;
  
    if (error<=tol)
        break;
    else
        format long
        Xk=Xk1;
    end
end
disp(' la raiz es: ');disp(Xk1);

plot(Xk1(1),Xk1(2),'Ob');
