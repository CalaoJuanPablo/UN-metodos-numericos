function [ M ] = MatrizCholesky( n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    M= randi(n,n);
    for i=1:n
        suma=0;
       for j=1:n
          suma=suma+abs(M(i,j)); 
       end
       suma=suma-M(i,i);
        M(i,i)=suma+i;
    end
    
end

