clc; clear all;

Ab=input('Digite número de estados absorbentes: ');

if isscalar(Ab)
else
    disp('No es un ingreso válido')
    Ab=input('Digite número de estados absorbentes: ');
end

NAb=input('Digite el número de estados NO absorbentes: ');

if isscalar(NAb)
else
    disp('No es un ingreso válido')
    NAb=input('Digite número de estados absorbentes: ');
end

Id=eye(Ab); %Crea la submatriz I de la matriz de transición
O=zeros(Ab,NAb); %Crea la submatriz 0 de la matriz de transición

R=input('Digite la submatriz R: '); %Subatriz R de la matriz de transición
[a,b]=size(R);

if a~=NAb || b~=Ab %Valida que la submatriz R tenga la dimensión correcta
    disp('El tamaño no concuerda con los valores iniciales');
    R=input('Digite matriz R: ');
end

Q=input('Digite la matriz submatriz Q: '); %Subatriz Q de la matriz de transición
[a,b]=size(Q);

if a~=NAb || b~=NAb %Valida que la submatriz Q tenga la dimensión correcta
    disp('El tamaño no concuerda con los valores iniciales');
    R=input('Digite matriz Q: ');
end

Mtrans=[Q R;O Id]; %Construye la matriz de transición
I=eye(NAb); %Matriz identidad para hallar la fundamental

N=inv(I-Q); %Matriz fundamental
NR=N*R; %Matriz NR

disp('Matriz de transición')
disp(Mtrans)
disp('Matriz fundamental')
disp(N)
disp('Matriz de probabilidades de estado estable')
disp(NR)