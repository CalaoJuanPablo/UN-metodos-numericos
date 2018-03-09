% Algoritmo de factorizacion LU (Gauss)
clc; clear all;
A=input('Digite la Matriz cuadrada A: ');
%B=input('Digite el vector solución B (Vecrtor columna): ');
cA=A; %Guarda una copia de la matriz A
n=size(A,1); %Asigna a n el tamaño de la matriz A
L=eye(n); %Crea una matriz identidad de tamaño n
%X=A\B;

for j=1:n-1
    for i=j+1:n
        m=A(i,j)/A(j,j);
        L(i,j)=m;
        A(i,:)=A(i,:)-m*A(j,:);
    end
end
U=A;
disp('Esta es A')
disp(cA)
disp('Esta es L')
disp(L)
disp('Esta es U')
disp(U)
disp('Esta es la solución: ')
disp(X)