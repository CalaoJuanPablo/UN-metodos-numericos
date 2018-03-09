%Histograma de frecuencias datos agrupados

datos = input('Digite los datos []: ');
disp('Escoja método para el número de clases: ')
disp('1. Método de Sturges')
disp('2. Número de clases preestablecido')
opt = input('');

minimo = min(dados);
maximo = max(datos);
R = maximo - minimo;

switch (opt)
    case 1
        
    case 2
        nc = input('Digite el número de clases: ');
        A = R / nc;
        X = zeros(nc,9);
        X(:,1) = 1:nc;
        X(1,2) = minimo;
        X(1,4) = minimo + A;
        X(1,3) = (X(1,4) + X(1,2))/2;
        
        for i = 2 : 1 : nc
           
            X(i,2) = X(i-1,4);
            X(i,4) = X(i,2) + A;
            X(i,3) = (X(i,4) + X(i,2)) / 2;
            
        end
end