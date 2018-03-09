%Factorización LU con pivoteo
clc; clear all;
U=input('Digite una matriz cuadrada: ');
disp(U);
n=size(U);
if (n(1,1) ~= n(1,2))
    disp('La matriz no es cuadrada. Digite una nueva matriz CUADRADA: ')
else
    A=U;
    P=eye(n);
    L=zeros(n);
    for j=1:n
        for i=j:n
            if(U(i,j) ~= 0)
                U([i,j],:)=U([j,i],:);
                P([i,j],:)=P([j,i],:);
                L(j,j)=U(j,j);
                U(j,:)=U(j,:)/U(j,j);
                for k = j+1:n
                    L(k,j)=U(k,j);
                    U(k,:)=U(k,:)-U(k,j)*U(j,:);
                end
                i=-1;
            end
        end
    end
    disp('Esta es L: '); disp(L);
    disp('Esta es U: '); disp(U);
    disp('Esta es P: '); disp(P);
    disp('Esta es A: ');A=P*L*U;
    disp(A);
    disp('Esta es PA: ');
    B=P*A;disp(B);
    disp('Esta es LU : ');
    C=L*U;
    disp(C);
        
end
