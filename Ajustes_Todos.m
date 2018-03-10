clear all;
%Pedimos el Vector de n puntos para aproximar la curva.
sw=1;
while(sw)
   clc;
   x= input('Digite el Vector de Coordenadas en X: \n');
   y= input('Digite el Vector de Coordenadas en Y: \n');
   A1= length(x);
   A2=length(y);
   sw=(A1~=A2); 
end
clear vars A1 A2
%Un menu de opcion que valida que tipo de transformación se quiere usar.
sw=1;
while(sw)
    clc;
    fprintf('Seleccione entre los modelos de funciones disponibles una opcion: \n');
    fprintf('\n1. y= A/x+ B');
    fprintf('\n2. y= D/(x+C)');
    fprintf('\n3. y=1/(A*x+B)');
    fprintf('\n4. y=x/(A*x+B)');
    fprintf('\n5. y=A*ln(x)+B');
    fprintf('\n6. y=C*e^(A*x)');
    fprintf('\n7. y=C*x^A');
    fprintf('\n8. y=(A*x+B)^-2');
    fprintf('\n9. y=C*x*e^(-D*x)');
    fprintf('\n10. y=L/(1+C*e^(A*x))\n');
    opcion=input('');
    sw= ~(0<opcion && opcion<11);
end

clc;

%Ejecutamos las diversas transformaciones y pedimos los valores que hagan
%falta pedir.

switch(opcion)
    case 1
        %y= A/x+ B
         X=1./x;
         Y=y;
    case 2
        %y= D/(x+C)
        X=x.*y;
        Y=y;
    case 3
        %y=1/(A*x+B)
        X=x;
        Y=1./y;
    case 4
        %y=x/(A*x+B)
        X=1./x;
        Y=1./y;
    case 5
        %y=A*ln(x)+B
        X=log(x);
        Y=y;
    case 6
        %y=C*e^(A*x)
        X=x;
        Y=log(y);
    case 7
        %y=C*x^A
        X=log(x);
        Y=log(y);
    case 8
        %y=(A*x+B)^-2
        X=x;
        Y= y.^(-1/2);
    case 9
        %y=C*x*e^(-D*x)
        X=x;
        Y=log(y./x);
    case 10
        %y=L/(1+C*e^(A*x))
        L=input('Introduzca el valor L: \n');
        X=x;
        Y=log(L./y-1);
end

%Generamos el polinomio que mejor se ajuste a la curva y sacamos las
%constantes A y B producto de la linealizacion original.

Polinomio = polyfit(X,Y,1);
A=Polinomio(1);
B=Polinomio(2);

%En la funcion objetivo o resultado que contendra las tranformaciones
%Reemplazaremos 'x' por el valor 't' con muchisimos puntos para aproximar
%de la mejor forma la curva.
t=min(X):0.1:max(X);
clear vars X Y;

%Calculamos las Constantes C y D en el caso y armamos la funcion.

switch(opcion)
    case 1
        %y= A/x+ B
         f=A./t+B;
    case 2
        %y= D/(x+C)
        C=-1/A;
        D=-B/A;
        f=D./(t+C);
    case 3
        %y=1/(A*x+B)
        f=1./(A.*t+B);
    case 4
        %y=x/(A*x+B)
        f=t./(A.*t+B);
    case 5
        %y=A*ln(x)+B
        f=A.*log(t)+B;
    case 6
        %y=C*e^(A*x)
        C=exp(B);
        f=C.*exp(A*t);
    case 7
        %y=C*x^A
        C=exp(B);
        f=C.*t^A;
    case 8
        %y=(A*x+B)^-2
        f=(A*t+B).^(-2);
    case 9
        %y=C*x*e^(-D*x)
        C=exp(B);
        D=-A;
        f=C.*t.*exp(-D*t);
    case 10
        %y=L/(1+C*e^(A*x))
        C=exp(B);
        f=L./(1+C*exp(A*t));
end

%Graficamos todos los puntos originales sin su transformación.
plot(x,y,'*');
%Mantenemos lo que esta en el lienzo de dibujo actual para posteriormente
%graficar la funcion.
hold on;
%Graficamos la Curva con los parametros de t y f(t)
plot(t,f);

%Exitos en el Parcial :)
fprintf('Gracias por usar este programa...\n');
