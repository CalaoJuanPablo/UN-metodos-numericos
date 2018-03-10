clc; clear all;
syms v t
t=-5:0.01:5;
v=5;
f=inline('(((gamma((v+1)/2))/(((pi*v).^0.5)*gamma(v/2)))*(1/((((t.^2)/v)+1).^((v+1)/2)))');
ezplot(f)