function [ M ] = Rota90MR(A,i,n,M)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if(i<=n)
        M(:,i)=A(n-i+1,:);
        M=Rota90MR(A,i+1,n,M);
    end
end
