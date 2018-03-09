clc;
clear all;

n = input('Digita n: ');
jessica = 0:0.01:2*pi;
f = sin(n*jessica).*cos(n*jessica);
polar(jessica,f,'--b');

