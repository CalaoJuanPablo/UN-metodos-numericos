clc;
clear all;

M = input('Digite una matriz: \n');
k = input('Digite un valor de la diagonal secundaria: \n');
[nf,nc] = size(M);
Nueva = zeros(nf,nc);
for i=1:nf
    for j=1:nc
        if(j+i==k)
            Nueva(i,j)=M(i,j);
        end
    end
end
clc;
disp('Matriz Anterior: ');
disp(M);
disp('Nueva Matriz: ');
disp(Nueva);