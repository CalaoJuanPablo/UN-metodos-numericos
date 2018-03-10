clear all;
clc;
syms x;

f= input('Digita una funcion f(x): \n');
g= input('Digita una funcion g(x): \n');

h= f-g;
k= input('Digita el valor maximo de iteraciones: \n');
X1=input('Escriba el valor inicial de la Raiz (a): \n');
Tol= input('Escriba el valor de la tolerancia: \n');
sw=1;
i=1;

while (sw==1 && i<k) 
    XK1= X1 -(subs(h,x,X1)/subs(diff(h),x,X1));
    Error = abs(XK1-X1);
    X1 = XK1;
    i=i+1;
    sw= (Error > Tol);
end
if(i>k)
    disp(strcat('No se ha encontrado la raiz por que el error ha excedido la tolerancia permitida o Ha excedido el numero maximo de iteraciones.'));
else
    disp(strcat('La raiz es: ', num2str(X1)));
    plot(X1,0,'O'); hold on;
end
ezplot(h);
grid on;
