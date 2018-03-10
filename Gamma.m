function [ Gx ] = Gamma(x)
    syms t;
    Gx=integral(@(t) (t.^(x-1)).*exp(-t),0,Inf);
end

