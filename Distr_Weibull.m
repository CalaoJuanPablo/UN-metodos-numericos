% Distribucion de Weibull 
%(Tabla función de densidad y funcion de distribución de probabilidad)
% X=alpha, Y=beta
clc; clear all; close all;

X=[1,2];
Y=1;

t=0:.1:2.5;
while length(X)~=length(Y)
    disp('Los vectores de alpha y beta deben tener la misma dimensión')
    X=input('Digite los valores de alpha: ');
    Y=input('Digite los valores de beta: ');

end    
n=length(X);
Tfdp=zeros(28,n+1);
Tfdp(1:2,1)=0;
Tfdp(3:end,1)=t;
Tfdp(1,2:end)=X; Tfdp(2,2:end)=Y;
for i=1:26
    for j=1:n
        Tfdp(i+2,j+1)=X(j)/Y(j)^X(j)*t(i)^(X(j)-1)*exp(-(t(i)/Y(j))^X(j));
    end
end

FDP=zeros(28,n+1);
FDP(1:2,1)=0;
FDP(3:end,1)=t;
FDP(1,2:end)=X; FDP(2,2:end)=Y;

for i=1:26
    for j=1:n
        FDP(i+2,j+1)=1-exp(-(t(i)/Y(j)).^X(j));
    end
end

disp('Tabla de densidad de probabilidad')
disp(Tfdp)
disp('Tabla de distribución de probabilidad')
disp(FDP)
subplot(1,2,1),plot(Tfdp(3:end,1),Tfdp(3:end,2:end))
subplot(1,2,2),plot(FDP(3:end,1),FDP(3:end,2:end))