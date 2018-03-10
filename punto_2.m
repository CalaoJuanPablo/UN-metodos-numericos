clc;clear all;
sw=0;
while sw==0
A=input('Digite la matriz de puntos de la forma [a1 b1;a2 b2;...;an bn] :');
n=size(A);
m=n(2);
if m==2
    sw=1;
end
end
m=n(1,1);
t=0:0.1:2.5;
a=transpose(A(1,1));
b=transpose(A(1,2));
coe1=(a/b^a);
ex1=a-1;
f=(coe1*t.^ex1).*exp(-(t./b).^a);
cn=transpose(f);
B=cn;
syms x
fsi=(coe1*x^ex1)*exp(-(x/b)^a);
fi=int(fsi,x);
D=subs(fi,x,t);
C=transpose(D);
for i=2:1:m
    a=transpose(A(i,1));
    b=transpose(A(i,2));
    coe1=(a/b^a);
    ex1=a-1;
    f=(coe1*t.^ex1).*exp(-(t./b).^a);
    cn=transpose(f);
    B=[B cn];
       fsi=(coe1*x^ex1)*exp(-(x/b)^a);
    fi=int(fsi,x);
    D=subs(fi,x,t);
    E=transpose(D);
    C=[C E];
end


subplot(1,2,1),plot(B)
subplot(1,2,2),plot(C)