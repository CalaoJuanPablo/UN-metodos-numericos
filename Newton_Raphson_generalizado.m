clc;clear all;syms x y z;sw=0;
f=input('Digita el vector de funciones f=[a;b;c;...;n] ');n=length(f);
xyz=transpose(symvar(f));%devuelve un vector(fila) de las vbles dependientes de una funcion; transpose(symvar(f)) devuelve vector pero columna
if(n<=3)
    for i=1:n
        ezplot(f(i));hold on;
    end
    grid on;
end
xk=input('Digita el vector columna semilla xk=[x01;x02;...;x0n] ');
tol=input('Digita la tolerancia: ');
if isempty(tol)
    tol=10^-5;
end
J=jacobian(f);
for i=1:100    
    deltaX=-subs(J,xyz,xk)\subs(f,xyz,xk); %"\" lo de arriba por lo que esta debajo
    xk1=xk+deltaX;
    if (abs(xk1-xk)<=tol)       
        break;
    else
        xk=xk1;
    end
     
end

if i==100
    disp('El metodo no converge, cambie semilla');
else
    disp(strcat('El punto es solucion del sistema x: ',num2str(double(xk1(1))),' y: ',num2str(double(xk1(2)))));
    plot(xk1(1),xk1(2),'*m');
end