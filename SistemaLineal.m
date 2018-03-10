clear all;
sw=1;
while(sw==1)
    clc;
    A= input('Digite la matriz de Coeficientes: \n');
    B= input('Digite el Vector de Maricadas independientes: \n');
    [n1,n2]=size(A);
    [n4,n3]= size(B);
    if((n1==n2) && (n1==n3))
       deter= det(A);
       sw=0;
    end
end
if(deter~=0)
    tic
    x= A\B';
    disp(x);
    toc
else
   fprintf('Su matriz tiene determinante 0, vaya a joder a otro lado. \n'); 
end
fprintf('Gracias por usar este programa...! :)\n');
