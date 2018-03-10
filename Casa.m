function [ M ] = Casa( M,i,j,nf,nc,Vuelta,k,Estado)

    if(i==nf && j==fix((nc+1)/2))
        disp(M);
    else
        M(i,j)=k;
        switch(Estado)
            case 2
                M(i,nc+1-j)=k+1;
            case 3           
                M(i,nc-Vuelta+1)=k+1;
        end
        switch(Estado)
            case 1%Elemento de la Punta
                if(i==fix((nc+1)/2))%Esta en la posicion i=V,j=V
                    Estado=4;
                    M=Casa(M,i+1,j,nf,nc,k+1,Vuelta,Estado);
                else
                    Estado=2;
                    M=Casa(M,i+1,j-1,nf,nc,Vuelta,k+1,Estado);
                end
            case 2%Diagonal
                if(j==Vuelta)%Llego a la Columna Vuelta y fila V
                    Estado=3;
                    M=Casa(M,i+1,j,nf,nc,Vuelta,k+1,Estado);
                else%No llegó
                    M=Casa(M,i+1,j-1,nf,nc,Vuelta,k+2,Estado);
                end
            case 3%Hacia Abajo
                if(i==nf)%Llego a la ultima fila
                    Estado=1;
                    Vuelta=Vuelta+1;
                    M=Casa(M,Vuelta,fix((nc+1)/2),nf,nc,Vuelta,k+2,Estado);
                else%No llego
                    M=Casa(M,i+1,j,nf,nc,Vuelta,k+2,Estado);
                end
            case 4%Hacia Abajo de a uno
                M=Casa(M,i+1,j,nf,nc,Vuelta,k+1,Estado);
        end
    end
end

