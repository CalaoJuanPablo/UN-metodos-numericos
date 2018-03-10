clc
clear all
syms v t
f=inline('(gamma((v+2)/2)/(gamma(v/2)*(pi*v)^0.5))*((1+(t^2/v))^(-(v+1)/2))');
c1=0:0.05:0.25;
c1=[0 c1];
nc=length(c1);
f1=1:1:50;
f1=[0 f1];
nf=length(f1);
N=zeros(nf,nc);
N(1,:)=c1;
N(:,1)=f1;
for i=2:nf
    for j=2:nc
        t=N(i,1)+N(1,j);
    end
end
disp(N)