clear;

sw=1;

while(sw)
   clc;
   fprintf('Bienvenido, este es el menu principal del programa.\nPor favor selecciones una opcion entre las siguientes:\n');
   fprintf('1.Graficas de Distribuciones de Probabilidad.\n');
   fprintf('2. Resolución del problema de Diferencias Centradas e integración por Paradigma de Runge Kutta.\n');
   fprintf('3. Modificación del Proyecto: distribución Binomial Acumulada.\n');
   opcion=input('');
   sw= ~(opcion ==1 || opcion==2 || opcion==3);
end

clc;

switch(opcion)
    case 1
        sw=1;
        while(sw)
           clc;
           fprintf('Ahora selecciona que distribucíon quieres que se grafique:\n');
           fprintf('1. Distribución de T Students.\n');
           fprintf('2. Distribución de Chi Cuadrado.\n');
           fprintf('3. Modificación del Proyecto: Distribución Binomial Acumulada');
           opcion=input('');
           sw= ~(opcion ==1 || opcion==2 || opcion==3);
        end
        clc;
        v=1:25;
        syms x t real;
        switch(opcion)
            case 1
                fprintf('Distribución T Students.\n');
                fprintf('\nPor favor espere, esto podria tomar algunos minutos\n\n');
                Alfa=[0.4 0.25 0.10 0.05 0.025 0.01 0.005 0.0025 0.001 0.0005];
                Tabla= zeros(26,11);
                Tabla(1,2:11)=Alfa;
                Tabla(2:26,1)=v';
                for i=2:26
                    for j=2:11
                       Ht=int((Gamma((Tabla(i,1)+1)/2))/(Gamma(Tabla(i,1)/2)*(sqrt(Tabla(i,1)*pi))*((1+(x^2/Tabla(i,1)))^((Tabla(i,1)+1)/2))),-Inf,t)-Tabla(1,j); 
                       Raices=solve(Ht,t,'Real',true);
                       for r=1:length(Raices)
                           if(-double(Raices(r))>0)
                                Tabla(i,j)=-double(Raices(r));
                                break;
                           end
                       end
                       
                    end
                end
            case 2
                fprintf('Distribución de Chi Cuadrado.\n');
                fprintf('\nPor favor espere, esto podria tomar algunos minutos\n\n');
                Alfa=[0.999 0.995 0.990 0.975 0.950 0.05 0.025 0.001];
                Tabla =zeros(26,9);
                Tabla(1,2:9)=Alfa;
                Tabla(2:26,1)=v';
                for i=2:26
                    Xi=int(((x^((Tabla(i,1)-2)/2))*exp(-x/2))/(2^((Tabla(i,1)/2))*Gamma(Tabla(i,1)/2)),0,t);
                    for j=2:9
                        Raices= solve(Xi-Tabla(1,j));
                        for r=1:length(Raices)
                            if(double(Raices(r))>0)
                               Tabla(i,j)=double(Raices(r));
                               break;
                            end
                        end
                        if(Tabla(i,j)==0)
                            syms t positive;
                            Tabla(i,j)=double(solve(Xi-Tabla(1,j),t));
                            syms t real;
                        end
                    end
                end
        end
        disp(Tabla);    
    case 2
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
        sw=1;
        while(sw)
           clc;
           Exp=input('Digite el Grado de resolución del Problema: \nSolo puede Seleccionar entre 4° o 3° de resolución: ');
           sw=~(Exp==4 || Exp==3);
        end
        ResT=dsolve(strcat('Dy=',char(f)),strcat('y(',num2str(Pi(1)),')=',num2str(Pi(2))),'x');
        ResPapel=subs(ResT,x,X1);
        Yo=Pi(2);
        switch(Exp)
            case 3
                for i=1:n
                    D1=h*subs(f,[x,y],[X(i),Yo]);
                    D2=h*subs(f,[x,y],[X(i)+h/2,Yo+D1*h/2]);
                    D3=h*subs(f,[x,y],[X(i)+h,Yo+(-D1+2*D2)*h]);
                    Total=D1+4*D2+D3;
                    Yo=Yo+(Total/6);
                end
            case 4
                for i=1:n
                    D1=h*subs(f,[x,y],[X(i),Yo]);
                    D2=h*subs(f,[x,y],[X(i)+h/2,Yo+D1/2]);
                    D3=h*subs(f,[x,y],[X(i)+h/2,Yo+D2/2]);
                    D4=h*subs(f,[x,y],[X(i)+h,Yo+D3]);
                    Total=D1+2*D2+2*D3+D4;
                    Yo=Yo+(Total/6);
                end
        end
        clc;
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
        
    case 3
        n=input('Ingrese el valor de los n objetos para los que se haran ensayos de Bernoulli: \n');
        p=[0.01 0.05 0.10 0.20 0.25 0.30 0.40 0.50 0.60 0.70 0.75 0.80 0.90 0.95 0.99];
        filas=1;
        for i=1:n
           for j=0:i
              filas=filas+1; 
           end
        end
        Tabla= zeros(filas,length(p)+2);
        Tabla(1,3:(length(p)+2))=p;
        Relleno=2;
        for i=1:n
            Tabla(Relleno,1)=i;
            for j=0:i
                Tabla(Relleno,2)=j;
                Relleno=Relleno+1;
            end
        end
        
        for i=2:filas
            r=1;
            for k=1:i
               if(Tabla(k,1)~=0)
                  r= Tabla(k,1);
               end
            end
            for j=3:(length(p)+2)
                suma=0;
                for w=2:i
                   if(r==Tabla(w,1))
                       break;
                   end
                end
                if(i~=w)
                    suma=Tabla(i-1,j);
                end
                Tabla(i,j)=nchoosek(r,Tabla(i,2))*Tabla(1,j).^Tabla(i,2)*(1-Tabla(1,j))^(r-Tabla(i,2));
                Tabla(i,j)=Tabla(i,j)+suma;
            end
            if(Tabla(i,j)> 1.0004)
                Tabla(i,j)=0;
            end
        end
        fprintf('Distribucion binomial acumulada\n\n');
        disp(Tabla);
end
fprintf('\nGracias por usar este programa.\n');
