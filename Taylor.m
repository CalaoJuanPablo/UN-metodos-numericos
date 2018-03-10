clc;clear all
syms x p
f=input('Digite su función de x:');
v=input('Digite el punto inicial []:');
n=input('digite el grado del polinomio:');

for i=1:1:n
    suma=0;
for k=1:1:i
df=diff(f,k);
suma=suma+(subs(df,x,v)*(x-v)^k/factorial(k));

end
ezplot(f);hold on;plot(v,subs(f,x,v),'o');
m=ezplot(suma);set(m,'color','r');axis([-2.5*pi,2.5*pi,-1,1]);pause(1);hold off
end
disp(suma)
