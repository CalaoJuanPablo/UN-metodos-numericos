clc;clear all;
sw=0;
while sw==0
    a=input('Digite alfa : ' );
    if (0.5<=a)&& (a<=50)
        sw=1;
    end 
end
while sw==1
    b=input('Digite beta: ');
    if (1<=b)&&(b<=5)
        sw=0;
    end 
end
syms x
coe1=(a/b^a);
ex1=a-1;
fwe=(coe1*x^ex1)*exp(-(x/b)^a);
t=0:0.1:2.5;
fw=subs(fwe,x,t);
plot(t,fw)
hold on;
while sw==0
t1=input('Digite t1: ');
if 0<=t1 && t1<=2.5
    sw=1;
end
end

while sw==1
t2=input('Digite t2: ');
if 0<=t2 && t2<=2.5
    sw=0;
end
end

tcol=t1:0.1:t2;
fwc=subs(fwe,x,tcol);
area(tcol,fwc);
ft1=subs(fwe,x,t1);
ft2=subs(fwe,x,t2);
tcol=t1:0.1:t2;
fwc=subs(fwe,x,tcol);
area(tcol,fwc);
hold on;
plot(t1,ft1,'om')
hold on;
plot(t2,ft2,'om')
hold on;
fwedif=diff(fwe);
m1=subs(fwedif,x,t1);
m2=subs(fwedif,x,t2);
lin1=m1*(x-t1)+ft1;
lin2=m2*(x-t2)+ft2;
s=0.2:0.1:2;
g1=subs(lin1,x,s);
g2=subs(lin2,x,s);
plot(s,g1,'r')
hold on;
plot(s,g2,'r')
hold on;
