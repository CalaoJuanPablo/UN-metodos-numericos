clc; clear all; close all; syms x y z;
f=input('Digite la funcion f=');grid on;  hold on;
set(ezplot(f),'color','r');hold on;
deltaf=gradient(f);
x0=input('digite punto inicial para x ');
y0=input('digite punto inicial para y ');
q=subs(f,x,x0);
fxy=subs(q,y,y0);
for i=1:150
    deltafx=subs(deltaf,x,x0);
    deltafxy=subs(deltafx,y,y0);
    alp=z*deltafxy;
    alph1=(x0+alp(1));
    alph2=(y0+alp(2));
    alphax=subs(f,x,alph1);
    alphaxy=subs(alphax,y,alph2);
    fun=diff(alphaxy);  
df=diff(fun);
xk=5;
   tol=10^-5;
sw=0;
for j=1:100
    xk1=xk-subs(fun,z,xk)/subs(df,z,xk);
    if abs(xk1-xk)<tol
        sw=1;break;
    end
     xk=xk1;%Faltaba esta instrucción, actualizar xk para la siguiente iteración.
end
x1=x0+(xk1*deltafxy(1));
y1=y0+(xk1*deltafxy(2));
newx=subs(deltaf,x,x1);
newxy=subs(newx,y,y1);
if(newxy(1)==0)
    meme=1;
else
    meme=0;
end
if(newxy(2)==0)
    meme1=1;
else
    meme1=0;
end
if(meme1+meme==2)
    break
else
    x0=x1;
    y0=y1;
end
end
 jh=solve(f,y);
  idiot=subs(jh,x,x1);
  idiot1=idiot(1);
  disp('un máximo de la función es ');
  disp(x1);
  disp(idiot1);
plot(x1,idiot1,'om')
