clear all;
sw=1;

while(sw)
   A= input('Digite una matriz estrictamente Dominante con respecto a su diagonal principal y definida positiva: \n');
   [nf,nc]=size(A);
   sw=(nf~=nc);
end

L=zeros(nf,nf);
L(1,1)=sqrt(A(1,1));
for k=2:nf
   for i=1:k
      termino=0;
      if(k==i)
          for j=1:k-1
            termino=termino+(L(k,j))^2;
          end
          termino=sqrt(A(k,k)-termino);
      else
          for j=1:i-1
            termino=termino+(L(k,j)*L(i,j));
          end
          termino = ((A(k,i)-termino)/L(i,i));
      end
      L(k,i)=termino;
   end
end

fprintf('La matriz L es: \n');
disp(L);
