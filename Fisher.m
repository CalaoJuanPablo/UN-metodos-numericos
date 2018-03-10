clc
clear all
f1=0.05:0.01:0.1;
f1=[0 f1];
nf=length(f1);
c1=1:1:50;
c1=[0 c1];
nc=length(c1);
N=zeros(nf,nc);
N(1,:)=c1;
N(:,1)=f1;
for i=2:nf
    for j=2:nc
        F=N(i,1)+N(1,j);
        f=@(v1,v2)(((gamma((v1+v2)/2).*((v1./v2).^(v1/2)))./(gamma(v1/2).*gamma(v2/2))).*((F.^((v1/2)-1))./((1+v1.*(F./v2)).^((v1+v2)/2))));
        N(i,j)=quad(f,0.05,0.1);
    end
end
