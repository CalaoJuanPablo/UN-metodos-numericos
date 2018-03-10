%Ajuste de curvas

clc; clear all;

%Modelos
% 1) Y=D./(X+C);X=xy;Y=y;C=-1/A;D=B*C;
% 2) Y=1/(Cx+D);X=x;Y=1/y;C=A;D=B;

P=input('Digite la matriz, de nx2 con los puntos: ');
x=P(:,1); y=P(:,2); plot(x,y,'Ok'); hold on;
X=x; Y=1./y; RL=polyfit(X,Y,1);
A=RL(1); B=RL(2); C=A; D=B;
ejex=min(x):0.01:max(x);
ejey=1./(C.*ejex+D);% ejey es el Y de los modelos, y ejex es X en los modelos
plot(ejex,ejey,'m'); hold on
disp(C)
disp(D)
ejey=D./(ejex+C);
plot(ejex,ejey,'b'); hold on;