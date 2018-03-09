%-- Regula Falsi --%
clear all;
clc;
syms x;

f= inline(input('Digite una Función de X: \n'));
a=input('Digita el valor inicial del intervalo para evaluacion A: \n ');
b=input('Digita el valor final del intervalo para evaluacion B: \n ');
Tol = input('Digita el valor de la tolerancia: \n ');
Sw=0;
disp(f(b));
while(a>=b)
    a=input('Digita, nuevamente el valor inicial del intervalo para evaluacion A: \n ');
    b=input('Digita, nuevamente el valor final del intervalo para evaluacion B: \n ');
end

while(Sw==0)
    
   Error= abs((b-a)/2);
   
   Xk= b- (((b-a)*f(b))/(f(b)-f(a)));
   if(f(Xk)==0)
      disp(strcat('Encontre tu Raiz, en el punto: ', num2str(Xk)));
      plot(Xk,0,'O');
      hold on;
      break;
   else
       if(f(a)*f(Xk)<0)
           b=Xk;
       else
           a=Xk;
       end
   end
   Sw=(Error<Tol);
end
ezplot(f);
xlabel('Valores de X');
ylabel('Valores de f(x)');
grid on;
