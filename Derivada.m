clear;
clc;
syms x;

f= inline(input('Digite una funcion de f(x): \n'),'x');
tol= input('Introduzca un valor real para la tolerancia: \n');
Xo= input('Introduce el valor del Punto X_0: \n');
h=1;
sw=1;

while(sw)
    R= (f(Xo+h)-f(Xo))/h;q
    h=h/10;
    sw=(h>tol);
end

fprintf(strcat('El valor de la derivada de la funcion: \t',str(f), '\t es: \t',num2str(R)));
