clear all;
clc;

sw=1;
        
syms u w x y z;

while(sw)
    clc;
    n=input('Por favor digite el numero ecuaciones no lineales que desea resolver en su sistema: \n');
    if(3<=n && n<=5)
        sw=0;
    end
end
Sistema = sym(n);

for i=1:n
    Ecuacion=input(strcat('Digite la Ecuación de: ', num2str(n),' variables, en la posicion: ',num2str(i),' del vector:\n'));
    Sistema(i)=Ecuacion;
end

switch(n)
    case 3
        V=[x,y,z];
        clear vars u w;
    case 4
        V=[w,x,y,z];
        clear vars u;
    case 5
        V=[u,w,x,y,z];
end

sw=1;
while(sw)
    Pk= input('Digite el Vector con los puntos de Referencia: \n');
    [~,ancho]=size(Pk);
    if(ancho==n)
        sw=0;
    end
end

TolP=input('Digita la Toleracia para el valor P: \n');
Max= input('Digita el máximo de iteraciones permitidas: \n');
iter=0;
sw=1;
clc;
clear vars opcion ancho Ecuacion;
while(sw)
    FP=Sistema';
    for i=1:n
        FP(i)=subs(FP(i),V(:),Pk);
    end
    Jacobiano  = jacobian(Sistema,V);
    for i=1:n
        Jacobiano(i,:)=subs(Jacobiano(i,:),V(:),Pk);
    end
    deltaP= -Jacobiano\FP;
    Pk1=double(Pk-deltaP');
    iter=iter+1;
    sw =((norm(Pk1-Pk)<TolP) && (iter<Max));
    Pk=Pk1;
    clear vars Pk1 deltaP i Jacobiano FP;
end

fprintf('Sistema en Mencion: \n');
disp(Sistema');
fprintf('La Solucion del Sistema es: \n');
disp(Pk');