function [approx_value] = Composite_simpsons(f, lower_lim, upper_lim, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h = (upper_lim-lower_lim)/n;
X1=f(upper_lim)+f(lower_lim);
X2=0;
X3=0;
for i=1:n-1
    X=lower_lim+i*h;
    if(mod(i,2)==0)
        X3=X3+f(X);
    else
        X2=X2+f(X);
    end

    
end    
approx_value= h*(X1+2*X3+4*X2)/3;

end