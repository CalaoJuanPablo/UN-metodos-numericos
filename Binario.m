clear all;
clc;

X= input('Digite un numero real: \n');
A= int32(fix(abs(X)));

if(X<0)
   signo=1; 
else
   signo=0;
end

B= double(abs(X)-fix(abs(X)));
CopiaB=B;
K='';
while(A~=0)
   K=strcat(K,num2str(mod(A,2)));
   A=idivide(A,2,'fix');
end

K=fliplr(K);

G=num2str(fix(CopiaB*2));
CopiaB= (CopiaB*2- fix(CopiaB*2));
Sw=1;

while(Sw==1)
   G=strcat(G,num2str(fix(CopiaB*2)));
   CopiaB= (CopiaB*2- fix(CopiaB*2));
   if(double(CopiaB)==double(0))
      Sw=0;
   end
   if(eq(double(CopiaB),double(B)))
      Sw=0; 
   end
end

G=fliplr(G);

Num = strcat(num2str(K),'.',num2str(G));

if(Num(1)=='1')
   Num=strcat(num2str(0),Num); 
end

[an,al]= size(Num);

for i=1:al
    if(Num(i)=='.')
        Punto=i;
        break;
    end
end

while(Num(2)~='.' )
   for i=3:al
      if(Num(i)=='.')
          break;
      end
   end
   Num(i)=Num(i-1);
   Num(i-1)='.';
end

disp(strcat(Num,' x 2^',num2str(Punto-2)));

Exp=dec2bin((Punto-2)+127);
x1=num2str(signo);
x1=strcat(x1,num2str(Exp));

for i=9:31
   x1=strcat(x1,Num(i-6));
end
x2= zeros(1,32);

for i=1:32
    x2(i)=str2double(x1(i));
end
x1=x2;
x2= zeros(1,32);
x2(32)=1;
x2=dec2bin(x1+x2);
x2=x2';
x3=zeros(1,32);
for i=1:32
    x3(i)=str2double(x2(i));
end
x2=x3;
