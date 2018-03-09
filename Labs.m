clear all
n=input('Digite el numero de valores que desea resolver usando X1, X2, ...: ');

% pedir por pantalla la aproximación inicial

for i=1:n
    x(i,1)=input('Digite la aproximacion inicial a la solucion x1,x2,...: ');
    
end
tol=input('Digite la tolerancia del f(xr) = 0, siendo xr la aproximacion a la raiz: ');

% Obtener jacobiano y reemplazar la aproximacion inicial en las funciones

for i=1:n
    
    cad='X';
    numf=int2str(i);
    fun{i}=input('Digite la función igualada a 0: ','s');
    
end
sw=0;
while sw==0
    
for i=1:n
    
    funr=fun{i};
    for j=1:n
         numf2=int2str(j);
         funr=strrep(funr,strcat(cad,numf2),(num2str(x(j,1))));
    end
    N(i,1)=str2num(funr);
    
       
    for k=1:n
        numfun=int2str(k);
        funder=char(diff(sym(fun{i}),strcat(cad,numfun)));
        
        for m=1:n
            numfun2=int2str(m);
            funder=strrep(funder,strcat(cad,numfun2),(num2str(x(m,1))));
        end
        M(i,k)=str2num(funder);
    end
       
end
x=x-inv(M)*N;
suma=0;
for m=1:n
    if abs(N(m,1)) < tol
        suma=suma+1;
    end
end
if suma == n;
        sw=1;
   else
        sw=0;
end
end
for i=1:n
    fprintf('Las raices aproximadas son: %f\n',x(i));
end


