clear all;

sw=1;

while(sw)
    clc;
    M1= input('Digite la Matriz No. 1: \n');
    M2= input('Digite la Matriz No. 2: \n');
    
    [nf,~]=size(M1);
    [~,nc]=size(M2);
    
    if(nc==nf)
        sw=0;
    end
end
clc;
fprintf('Sin vectorización: \n')
tic
nf1=size(M1,1);nc1=size(M1,2);
nf2=size(M2,1);nc2=size(M2,2);
for i=1:nf1
    for j=1:nc2
        suma=0;
        for k=1:nc1
            suma=suma+M1(i,k)*M2(k,j);
        end
        C(i,j)=suma;
    end
end
fprintf('Matriz A: \n');
disp(M1)
fprintf('Matriz B: \n');
disp(M2)
fprintf('Matriz AxB: \n');
disp(C);
toc;
clear vars suma nc1 nc2 nf1 nf2 i j k sw;
fprintf('\n\nCon Vectorización: \n')
tic
for i=1:nf
    for j=1:nc
        C(i,j)=M1(i,:)*M2(:,j);
    end
end
fprintf('Matriz A: \n');
disp(M1)
fprintf('Matriz B: \n');
disp(M2)
fprintf('Matriz AxB: \n');
disp(C);
toc;
