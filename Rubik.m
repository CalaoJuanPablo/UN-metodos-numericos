function [ R ] = Rubik( R,i,j,n)

if(i<=fix(n/2))
    temp=R(i,j);
    disp(R);
    R(i,j)=R(n+1-j,i);
    disp(R);
    R(n+1-j,i)=R(n+1-i,n+1-j);
    disp(R);
    R(n+1-i,n+1-j)=R(j,n+1-i);
    disp(R);
    R(j,n+1-i)=temp;
    disp(R);
    if(j+i ==n)
        R=Rubik(R,i+1,i+1,n);
    else
        R=Rubik(R,i,j+1,n);
    end
end
end

