clc; clear all; close all;

disp('Algoritmo de arrepentimiento')
OD=input('Ingrese los valores de la matriz de origen-destino: '); %Lee la matriz
[m,n]=size(OD); %Calcula la dimensión de la matriz
sw=0; 

% Valida que la matriz sea cuadrada------------------------------------
while(sw==0)
if isequal(m,n)
    ODcopia=OD; %Crea una copia de la matriz
    f0=zeros(1,m); %Vector contador de 0 en fila
    c0=zeros(1,n); %Vector contador de 0 en columna
    sec=zeros(m,2);    
    sw=1;
else
    dips('La matriz no es cuadrada');
    OD=input('Ingrese los valores de la matriz de origen-destino: ');
    [m,n]=size(OD);
end
end
%----------------------------------------------------------------------

for j=1:m-1
% Busca 0 por fila-----------------------------------------------------
for i=1:m
    a=find(OD(i,:)==0);
    f0(i)=length(a);
end
%----------------------------------------------------------------------

% Encuentra filas con cero, en caso de no haber, hace la operación
% correspondiente------------------------------------------------------
a=find(f0==0); 
if isempty(a)
else
    for i=1:m
        a=min(OD(i,:));
        OD(i,:)=OD(i,:)-a;
    end
end
%----------------------------------------------------------------------

% Busca 0 por columna--------------------------------------------------
for i=1:n
    a=find(OD(:,i)==0);
    c0(i)=length(a);
end
%----------------------------------------------------------------------

% Encuentra columnas con cero, en caso de no haber, hace la operación
% correspondiente------------------------------------------------------
a=find(c0==0);
if isempty(a)
else
    for i=1:n
        a=min(OD(:,i));
        OD(:,i)=OD(:,i)-a;
    end
end
%----------------------------------------------------------------------

[f0,c0]=find(OD==0); %Hallar coordenadas de los ceros en la matriz origen-destino
arr=zeros(1,length(f0));

%Cálculo del arrepentimiento-------------------------------------------
for i=1:length(f0)
    x=[OD(f0(i),1:c0(i)-1) OD(f0(i),c0(i)+1:end)];
    y=[OD(1:f0(i)-1,c0(i));OD(f0(i)+1:end,c0(i))];
    arr(i)=min(x)+min(y);
end
%----------------------------------------------------------------------

%Elimina fila y columna con max arrepentimiento, y pone infinito en la
%asignación inversa
maxarr=max(arr);
i=find(arr==maxarr);
OD(f0(i(1)),:)=inf;
OD(:,c0(i(1)))=inf;
OD(c0(i(1)),f0(i(1)))=inf;
%----------------------------------------------------------------------

sec(j,:)=[f0(i(1)),c0(i(1))]; %Guarda la secuencia a seguir en cada iteración

end

[i,j]=find(OD==0);
sec(m,:)=[i,j]; %Escribe la última asignación en la matriz de pares de secuencia

secfinal=zeros(n); %Matriz que guardará las secuencias posibles halladas

%Llena la matriz con las secuencias posibles halladas------------------
for i=1:m
    secfinal(i,1:2)=sec(i,1:2);
    for j=3:m
        x=find(sec(:,1)==secfinal(i,j-1));
        secfinal(i,j)=sec(x,2);
    end
end
%----------------------------------------------------------------------
t=zeros(1,n);

%Calcula el costo de cada secuencia------------------------------------
for i=1:m
    for j=1:n-1
        t(i)=t(i)+ODcopia(secfinal(i,j),secfinal(i,j+1));
    end
end
%----------------------------------------------------------------------

tmin=min(t); %Halla el valor de costo mínimo
x=find(t==tmin); %Halla la posición en el vector que tiene el costo mínimo
secuencia=secfinal(x(1),:); %Escribe la secuencia de costo mínimo hallada

disp('La mejor secuencia encontrada es:')
disp(secuencia)
disp('Con costo mínimo de:')
disp(tmin)