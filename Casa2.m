function [ A ] = Casa2( A,i,j,nf,nc,k)

    A(i,j)=k;
    if(i==nf && j==fix((nc+1)/2))
        disp(A); 
    else
        if(i<fix((nc+1)/2))%Diagonales
           if(j<fix((nc+1)/2))
              A=Casa2(A,i,nc+1-j,nf,nc,k+1); 
           else
               if(j>fix((nc+1)/2))
                   A=Casa2(A,i+1,nc-j,nf,nc,k+1);
               else
                   A=Casa2(A,i+1,j-1,nf,nc,k+1);
               end
           end
        else%Hacia abajo y Repollo
            if(fix((nc+1)/2)<=i && i<=nf-1)%Abajo
               if(j>fix((nc+1)/2))
                   A=Casa2(A,i+1,nc+1-j,nf,nc,k+1);
               else
                  if(j<fix((nc+1)/2))
                    A=Casa2(A,i,nc+1-j,nf,nc,k+1);
                  end
               end
            else
                if(j>fix((nc+1)/2))%Cambio de Vuelta
                   A=Casa2(A,nc+2-j,fix((nc+1)/2),nf,nc,k+1); 
                else
                    A=Casa2(A,i,nc+1-j,nf,nc,k+1);
                end
            end           
        end
    end
end

