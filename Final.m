% Examen final Luis A. Mass Noriega

clear;

sw=1;

while(sw)
   clc;
   fprintf('Bienvenido, este es el menu principal del programa.\nPor favor selecciones una opcion entre las siguientes:\n');
   fprintf('1. Runge Kutta Ecuacion Diferencial.\n');
   fprintf('2. Distribución Gamma.\n');
   opcion=input('');
   sw= ~(opcion ==1 || opcion==2);
end

clc;

switch(opcion)
    case 1
        syms x y;
        f=input('Digite la Ecuacion Diferencial: \ndy/dx= ');
        sw=1;
        while(sw)
            clc;
            Pi=input('Digite en forma Vectorial [Xo,Yo] las condiciones inciales del P.V.I.:\n');
            sw=~(length(Pi)==2);
        end
        sw=1;
        while(sw)
           clc;
           X1=input('Introduce el Segundo Valor de X:\n');
           sw=~(X1>Pi(1));
        end
        n=input('Introduce el Numero de Pasos para resolver el Problema:\n');
        h=(X1-Pi(1))/n;
        X=Pi(1):h:X1;
        ResT=dsolve(strcat('Dy=',char(f)),strcat('y(',num2str(Pi(1)),')=',num2str(Pi(2))),'x');
        ResPapel=subs(ResT,x,X1);
        Yo=Pi(2);
        for i=1:n
            D1=h*subs(f,[x,y],[X(i),Yo]);
            D2=h*subs(f,[x,y],[X(i)+h/2,Yo+D1/2]);
            D3=h*subs(f,[x,y],[X(i)+h/2,Yo+D2/2]);
            D4=h*subs(f,[x,y],[X(i)+h,Yo+D3]);
            Total=D1+2*D2+2*D3+D4;
            Yo=Yo+(Total/6);
        end
        fprintf('\nSolución de Runge Kutta: \n Y(%.4f)= %.4f',X1,Yo);
        fprintf('\nSolución Analitica: \n Y(%.4f)= %.4f',ResPapel,Yo);
        fprintf('\nError Obtenido: \n%4.4f',abs(Yo-ResPapel));
        hold on;
        Lienzo1=ezplot(f);
        Lienzo2=ezplot(ResT);
        set(Lienzo1,'Color','b');
        set(Lienzo2,'Color','k');
        plot(X1,Yo,'Or');
        plot(X1,ResPapel,'*g');
        ylabel('Valores de Y');
        xlabel('Valores de X');
        legend('f','ResT','Yo','ResPapel');
        hold off;
    case 2
        sw=1;
        while(sw)
            clc;
            fprintf('Paso 1: contruir la Tabla con 300 Valores Dados Alfa y Beta.\n\n');
            Alfa= input('Digite el Valor de Alfa en esta Tabla de Distribución:\n');
            Beta= input('Digite el Valor de Beta en esta Tabla de Distribución:\n');
            sw=~(Alfa>0 && Beta>0);
        end
        sw=1;
        while(sw)
            clc;
            fprintf('Paso 2: Construir el Conjunto de Graficas de las Funciones de densidad.\n\n');
            Alfa1= input('Digite el Vector Alfa:\n');
            Beta1= input('Digite el Vector Beta:\n');
            sw=~(length(Alfa1) == length(Beta1));
        end
        Tabla=zeros(30,10);
        for j=1:2:10
           n=(j+1)/2;
           v=(30*(n-1)+1):(30*(n));
           Tabla(:,j)= v';
        end
        
        for j=2:2:10
           for i=1:30
              syms t;
              Tabla(i,j)= int(1/(Beta^Alfa*Gamma(Alfa))*(t^(Alfa-1))*(exp(-t/Beta)),0,Tabla(i,j-1));
           end
        end
         
        x=0:0.05:20;
        for i=1;length(Alfa)
           hold on;
           f=(1./(Beta1(i).^Alfa(i).*Gamma(Alfa(i)))).*(x.^(Alfa(i)-1)).*(exp(-x./Beta(i)));
           plot(x,f);
        end
        clc;
        fprintf('Paso 1:\n\n');
        fprintf('Distribucion Gamma:\n');
        disp(Tabla);
        fprintf('\n\nPaso 2:\n\n');
        fprintf('Vea la grafica en la Ventana Anexa.\n\n');
        x=0:0.05:20;
        for i=1:length(Alfa)
           plot(x,gampdf(x,Alfa(i),Beta(i)));
           hold on;
        end
end

clear;
fprintf('\nGracias por usar este programa.\n');
