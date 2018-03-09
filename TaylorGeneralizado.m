clc;clear all
syms x p
f=input('Digite su función de x:');
v=input('Digite el punto inicial []:');
n=input('Digite el grado del polinomio:');
s=0;
for k=0:n-1
df=diff(f,k);
h=factorial(k);
p=(subs(df,x,v)*(x-v)^k)/h;
s=s+p;
ezplot(f);hold on;plot(v,subs(f,x,v),'o');
m=ezplot(s);set(m,'color','r');axis([-2.5*pi,2.5*pi,-1,1]);pause(1);hold off
end
disp(s)
