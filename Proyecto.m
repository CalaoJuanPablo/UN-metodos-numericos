clear all;
clc;

sw=1;

while(sw)
    clc;
    fprintf('Bienvenido usuario, En el presente programa seleccione entre las opciones disponibles:\n')
    fprintf('1. Solución de sistemas no lineales: \n');
    fprintf('2. Solución de problemas usando Vectorización: \n')
    opcion= input('');
    if(opcion==1 || opcion==2)
        sw=0;
    end
end

clc;
switch(opcion)
    case 1
        sw=1;
        
        syms u w x y z;
        
        while(sw)
            clc;
            fprintf('Seleccionada la Opcion 1: Resolver Sistemas no lineales.\n');
            n=input('Por favor digite el numero ecuaciones no lineales que desea resolver en su sistema: \n');
            if(3<=n && n<=5)
                sw=0;
            end
        end
        Sistema = sym(n);
        
        for i=1:n
            Ecuacion=input(strcat('Digite la Ecuación de: ', num2str(n),' variables, en la posicion: ',num2str(i),' del vector:\n'));
            Sistema(i)=Ecuacion;
        end
        
        switch(n)
            case 3
                V=[x,y,z];
                clear vars u w;
            case 4
                V=[w,x,y,z];
                clear vars u;
            case 5
                V=[u,w,x,y,z];
        end
        
        sw=1;
        while(sw)
            Pk= input('Digite el Vector con los puntos de Referencia: \n');
            [~,ancho]=size(Pk);
            if(ancho==n)
                sw=0;
            end
        end
        
        TolP=input('Digita la Toleracia para el valor P: \n');
        Max= input('Digita el máximo de iteraciones permitidas: \n');
        iter=0;
        sw=1;
        clc;
        clear vars opcion ancho Ecuacion;
        while(sw)
            FP=Sistema';
            for i=1:n
                FP(i)=subs(FP(i),V(:),Pk);
            end
            Jacobiano  = jacobian(Sistema,V);
            for i=1:n
                Jacobiano(i,:)=subs(Jacobiano(i,:),V(:),Pk);
            end
            deltaP= -Jacobiano\FP;
            Pk1=double(Pk-deltaP');
            iter=iter+1;
            sw =((norm(Pk1-Pk)<TolP) && (iter<Max));
            Pk=Pk1;
            clear vars Pk1 deltaP i Jacobiano FP;
        end
        
        fprintf('Sistema en Mencion: \n');
        disp(Sistema');
        fprintf('La Solucion del Sistema es: \n');
        disp(Pk');
        
        opcion= input('¿Desea Mostrar Graficamente el sistema y su solución? [Y/N] \nRecuerde que esta opción solo esta disponible si su sistema maneja un maximo de 3 variables: ');
        
        if(opcion=='Y')
           if(n==3)
                for i=1:3
                   A=solve(Sistema,'z');
                   for j=1:length(A)
                      ezsurf(A(j))
                      hold;
                   end
                end
           else
               fprintf('No se ha podido acceder a su solicitud, su Sistema posee mas de 3 variables.\n')
           end
        end
        
    case 2
        clear vars opcion sw;
        fprintf('A continuación se presenta el ejemplo de la eliminación Gaussiana:\n')
        fprintf('Dada la matriz expandida A que se muestra a continuación:\n')
        %A = [[1 2 3]' [3 2 1]' [2 1 3]'];
        A= hilb(4);
        B=A;
        disp(A);
        fprintf('Con Vectorizacion:\n');
        tic
        for j=2:4
            for i=j:4
                A(i,:) = A(i,:) - A(j-1,:)*A(i,j-1)/A(j-1,j-1);
            end
        end
        toc
        
        tic
        disp(triu(A));
        fprintf('Sin Vectorizacion:\n');
        A=B;
        for k=1:3
            for i=k+1:4
                A(i,k+1:4) = A(i,k+1:4) - A(i,k)/A(k,k)*A(k,k+1:4);
            end
        end
        disp(triu(A));
        toc
end

fprintf('Gracias por usar este programa. Buen día.\n');
