% Distribución Normal

clc; clear all; 

f=inline('exp((-0.5*z.^2)/((2*pi)^0.5)');
F1=0:0.01:9; F1=[0 F1]; nC=length(F1);
C1=0:0.1:3.4; C1=[0 C1]; nF=length(C1);
N=zeros(nF,nC);
N(1,:)=F1;
N(:,1)=C1;

for i=2:nF
    for j=2:nC
        z=N(i,1)+N(1,j);
        quad(f,-5,z);
    end
end

disp(N)