%Interpolación de Lagrange

clc; clear all; close all;
syms x
a=input('Digite el vector de las X [] :');
b=input('Digite el vector de las Y [] :');
k = 0;
n = length(a);
for j = 1 : n
    t = 1;
    for i = 1 : n
        if i~=j
            t = t * (x-a(i))/(a(j)-a(i));
        end
    end
    k = k + t*b(j);
end
hold on
for i=1:n
 plot(a(i),b(i),'o')
    
end
disp('Su polinomio es:')
disp(k)
ezplot(k)
hold off
