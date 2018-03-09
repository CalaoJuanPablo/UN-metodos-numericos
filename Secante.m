%-- Secante --&
clear all;
clc;

syms x;

f= inline(input('Digite una funcion: '));
x0= input('Digite el valor de X inicial 1: ');
x1= input('Digite el valor de X inicial 2: ');
k= input('Digite el Maximo de iteraciones permitidas: ');
Sw=0;
i=1;

while(Sw==0)
   x2= x1-((f(x1)*(x1-x0))/(f(x1)-f(x0)));
   x0=x1;
   x1=x2;
   i=i+1;
   Sw=(x1==x0 && i<=k);
   
   if(Sw==1)
        disp(strcat('Raiz encontrada en el punto: ', num2str(x2)));
        plot(x2,0,'O');
        hold on;
        break;
   end
end

if(i>k)
    disp(strcat('\n Se ha excedido el maximo de iteraciones, ubique otros puntos.'));
end

ezplot(f);
grid on;
