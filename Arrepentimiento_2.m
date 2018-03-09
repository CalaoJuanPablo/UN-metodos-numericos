clc; clear all; close all;
disp('Algoritmo de arrepentimiento')
OD=input('Ingrese los valores de la matriz de origen-destino: ');
[m,n]=size(OD);
sw=0; 

while(sw==0)
if isequal(m,n)
    ODcopia=OD;
    f0=zeros(1,m);
    c0=zeros(1,n);
    sec=zeros(m,2);    
    sw=1;
else
    dips('La matriz no es cuadrada');
    OD=input('Ingrese los valores de la matriz de origen-destino: ');
    [m,n]=size(OD);
end
end

for k=1:m-1
    for i=1:m
    minf=min(OD(i,:));
    OD(i,:)=OD(i,:)-minf;
    end
    for j=1:n
        minc=min(OD(:,j));
        OD(:,j)=OD(:,j)-minc;
    end
    [f,c]=find(OD==0);
    a=length(f);
    arrepentimiento=zeros(1,a);
    for i=1:a
        fila=[OD(f(i),1:c(i)-1) OD(f(i),c(i)+1:end)];
        columna=[OD(1:f(i)-1,c(i));OD(f(i)+1:end,c(i))];
        arrepentimiento(i)=min(fila)+min(columna);
    end
    maximo=max(arrepentimiento);
    b=find(arrepentimiento==maximo);
    OD(f(b(1)),:)=inf;
    OD(:,c(b(1)))=inf;
    OD(c(b(1)),f(b(1)))=inf;
    sec(k,:)=[f(b(1)),c(b(1))];
end

[i,j]=find(OD==0);
sec(m,:)=[i,j];

secfinal=zeros(n);


for i=1:m
    secfinal(i,1:2)=sec(i,1:2);
    for j=3:m
        x=find(sec(:,1)==secfinal(i,j-1));
        secfinal(i,j)=sec(x,2);
    end
end

t=zeros(1,n);

for i=1:m
    for j=1:n-1
        t(i)=t(i)+ODcopia(secfinal(i,j),secfinal(i,j+1));
    end
end

tmin=min(t);
x=find(t==tmin);
secuencia=secfinal(x(1),:);

disp('La mejor secuencia encontrada es:')
disp(secuencia)
disp('Con costo mínimo de:')
disp(tmin)