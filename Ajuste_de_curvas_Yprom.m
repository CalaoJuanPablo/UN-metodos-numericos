%Ajuste de curvas Y prom

clc; clear all;

puntos=input('Digite la matriz de puntos [x1 y11 y12 ... y1n; xn yn1 yn2 ... ynn] ');
nf=size (puntos,1); nc=size (puntos,2); disp(puntos);
if nc>2
    for i=1:nf
        puntos(i,nc+1)=mean(puntos(1,2:nc));
    end
end
x=puntos(:,1); y=puntos(:,end);
plot(x,y,'Ok'); disp(puntos);

% Modelos

% 1) y=(A./x)+B; X=1./x; Y=y;
% 2) y=D./(X+C); X=x*y; Y=y; C=-1/A; D=-B/A;
% 3) y=1/(Ax+B); X=x; Y=1./y;
% 4) y=x./(Ax+B); X=1./x; Y=1./y;
% 5) y=A*log(x)+B; X=log(x); Y=y;
% 6) y=C*exp(A*x);X=x;Y=log(y);C=exp(B);
% 7) y=C*x.^A; X=log(x); Y=log(y); C=exp(B);
% 8) y=(A*x+B).^-2; X=x; Y=y.^-0.5;
% 9) y=C*x*exp(-D*x); X=x; Y= log(y./x);
% 10) y=L./(1+C*exp(A*x))= X=x; Y=log((L./y)-1);

% Escoger modelo y asignar los X grande y Y grande
%AB=polyfit(X,Y,1); A=AB(1); B=AB(2);

%para la grafica:
%ejex=min(x)-1:0.1:max(x)+1; ejey=Modelo teniendo en cuenta que x=ejex

hold on; plot(ejex,ejey);