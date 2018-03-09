clear all;
clc;
syms x;

f= inline(input('Digite una Función de X: \n'));
A=input('Digita el valor inicial del intervalo para evaluacion A: \n ');
B=input('Digita el valor final del intervalo para evaluacion B: \n ');
Tol = input('Digita el valor de la tolerancia: \n ');
Sw=1;

while(f(A)*f(B)>0)
    A=input('Digita, nuevamente el valor inicial del intervalo para evaluacion A: \n ');
    B=input('Digita, nuevamente el valor final del intervalo para evaluacion B: \n ');
end

F=f(A);
G=f(B);
antc=A;
antfc=f(A);
c=((A*G-B*F)/(G-F));
while(abs(c-antc)>Tol)
    if(f(A)*f(c)<0)
        B=c;
        G=f(c);
        if(antfc*G>0)
            G=G/2;
        end
    else
        A=c;
        F=f(c);
        if(F*antfc>0)
            G=G/2;
        end
    end
    antc=c;
    antfc=f(c);
    c=((A*G-B*F)/(G-F));
end
disp(strcat('Raiz encontrada en el punto: ', num2str(c)));
plot(c,0,'O');
hold on;
ezplot(f);
xlabel('Valores de X');
ylabel('Valores de f(x)');
grid on;
