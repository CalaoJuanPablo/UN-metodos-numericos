clear all;

sw=1;

while(sw)
   clc;
   opcion= input('Seleccione la opcion 1. Para Solucion de Sistema Lineal y 2. Para Solucion de ajuste de Curvas: \n'); 
   sw=~(opcion==1 || opcion==2); 
end

switch(opcion)
    case 1
        clc;
        sw=1;
        clear vars opcion;
        while(sw)
            B=input('Digite el Vector de terminos independientes: \n');
            sw=(length(B)~=4);
        end
        L=[1 0 0 0; 2/5 1 0 0; -3/5 -2/3 1 0; 1/4 -1/3 -4/17 1];
        U=[5 2 1 2; 0 -9/5 23/5 -4/5;0 0 17/3 20/3;0 0 0 30/17];
        P=[0 0 1 0;0 1 0 0;0 0 0 1;1 0 0 0];
        
        A=P\(L*U);
        fprintf('La Matriz A de Resultados Originales es: \n');
        disp(A);
        fprintf('La Solucion del Sistema Lineal es: \n');
        X= A\B';
        disp(X);
    case 2
        clc;
        clear vars opcion;
        x=[0.5 0.8 1.5 2.5 4];
        y=[1.1 2.4 5.3 7.6 8.9];
        
        X=1./x.^2;
        Y=1./y;
        Polinomio = polyfit(X,Y,1);
        A=Polinomio(1);
        B=Polinomio(2);
        D=1/B;
        C=A/B;
        t=min(x):0.1:max(x);
        plot(x,y,'Or')
        hold on;
        f=(D.*t)./(t+C);
        plot(t,f);
        fprintf(strcat('El Valor de la constante Cs: ',num2str(C)));
        fprintf(strcat('\nEl Valor de la constante Kmax: ',num2str(D),'\n'));
end
