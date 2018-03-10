clear all;
clc;
sw=1;

while(sw==1)
    A= input('Digite una matriz para factorizar, asegurese de que sea cuadrada: \n');
    [nf,nc]=size(A);
    sw=(nf~=nc); 
end

U=A;
L=eye(nc);
%Sacamos la Matriz de Multiplicadores.
for K=1:nc-1
   for i= K+1:nc
       L(i,K)=A(i,K)/A(K,K);
   end
end
%Usamos los Multiplicadores y Convertimos La matriz A en U que es una
%Matriz Triangular superior.
for j=2:nc
    for i=j:nc
        U(i,:) = U(i,:) - U(j-1,:)*U(i,j-1)/U(j-1,j-1);
    end
end

U=triu(U);
fprintf('Factorizacion LU: \n')
fprintf('Matriz L: \n');
disp(U);
fprintf('Matriz U: \n');
disp(L)
