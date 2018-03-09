clc
clear all
c1=0.001:0.05:0.5;
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
        x=N(i,1)+N(1,j);
        f=@(v,e)((1./((2.^(v/2)).*gamma(v/2))).*((v/2)-1).*(e.^(-x/2)));
        N(i,j)=quad(f,0.001,0.5);
    end
end
