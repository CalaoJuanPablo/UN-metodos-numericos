function [ Regresada ] = Regresiva( C , Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    n=length(Y);
    Regresada=zeros(n,1); Regresada(n)=Y(n)/C(n,n);
    for k=n-1:-1:1
        Regresada(k)=(Y(k)-C(k,k+1:n)*Regresada(k+1:n))/C(k,k);
    end
end

