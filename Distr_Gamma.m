% Distribución gamma

clc; clear all; close all;

% X=lamda Y=k
X=0; Y=0; tu=0;
t=0:.1:30;
while X<=0 && Y<=0 && tu<=0
    disp('Recuerde que los parámetros deben ser >0')
X=input('Digite el valor de Lamda: ');
Y=input('Digite el valor de k: ');
tu=input('Digite el valor t: ');
end


f=((1./X)./gamma(Y))*(((1./X).*t).^(Y-1)).*exp(-(1./X).*t);
set(plot(t,f),'color','blue'); axis([0 20 0 0.5]); hold on;

t=tu:0.1:20;
f=((1./X)./gamma(Y))*(((1./X).*t).^(Y-1)).*exp(-(1./X).*t);
I=trapz(t,f);
disp('La probabilidad de T<t es= '); disp(I)
area(t,f); hold on;

media=Y*X;

if tu>media
    f=((1./X)./gamma(Y))*(((1./X).*(tu-media)).^(Y-1)).*exp(-(1./X).*(tu-media));
    t=tu-media:0.1:f;
    plot(t,f); hold on;
else
    f=((1./X)./gamma(Y))*(((1./X).*(tu+media)).^(Y-1)).*exp(-(1./X).*(tu+media));
    t=f:0.1:tu+media;
    plot(t,f); hold on;
end