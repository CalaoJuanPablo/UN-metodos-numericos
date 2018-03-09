function [ Regresada ] = Progresiva( C, Y )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    n=length(Y);
    Regresada=zeros(n,1);
    Regresada(1)=Y(1)/C(1,1);
    for k=1:n-1,
        Regresada(k)=Y(k)-C(k,1:k-1)*Regresada(1:k-1);
        Regresada(k)=Regresada(k)/C(k,k);
    end
end

