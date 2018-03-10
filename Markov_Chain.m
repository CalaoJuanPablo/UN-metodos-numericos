clc; clear all;

Ab=input('Digite n�mero de estados absorbentes: ');

if isscalar(Ab)
else
    disp('No es un ingreso v�lido')
    Ab=input('Digite n�mero de estados absorbentes: ');
end

NAb=input('Digite el n�mero de estados NO absorbentes: ');

if isscalar(NAb)
else
    disp('No es un ingreso v�lido')
    NAb=input('Digite n�mero de estados absorbentes: ');
end

Id=eye(Ab); %Crea la submatriz I de la matriz de transici�n
O=zeros(Ab,NAb); %Crea la submatriz 0 de la matriz de transici�n

R=input('Digite la submatriz R: '); %Subatriz R de la matriz de transici�n
[a,b]=size(R);

if a~=NAb || b~=Ab %Valida que la submatriz R tenga la dimensi�n correcta
    disp('El tama�o no concuerda con los valores iniciales');
    R=input('Digite matriz R: ');
end

Q=input('Digite la matriz submatriz Q: '); %Subatriz Q de la matriz de transici�n
[a,b]=size(Q);

if a~=NAb || b~=NAb %Valida que la submatriz Q tenga la dimensi�n correcta
    disp('El tama�o no concuerda con los valores iniciales');
    R=input('Digite matriz Q: ');
end

Mtrans=[Q R;O Id]; %Construye la matriz de transici�n
I=eye(NAb); %Matriz identidad para hallar la fundamental

N=inv(I-Q); %Matriz fundamental
NR=N*R; %Matriz NR

disp('Matriz de transici�n')
disp(Mtrans)
disp('Matriz fundamental')
disp(N)
disp('Matriz de probabilidades de estado estable')
disp(NR)