clear;
clc;
syms x;
f= inline(input('Digita una función desgenerado:\n'));
n= input('Digita el valor de n:\n');
sw=1;
while(sw)
    clc;
    a=input('Digite el limite inferior de integración:\n');
    b= input('Digite el limite superior de integración:\n');
    sw=~(a<b);
end
clear vars sw;
suma=0;
h=(b-a)/n;
for i=1:n-1
    suma=suma+f(a+i*h);
end
I=(h/2)*(f(a)+2*suma+f(b));

fprintf('El valor de la integral de la funcion f: %f\n',I);