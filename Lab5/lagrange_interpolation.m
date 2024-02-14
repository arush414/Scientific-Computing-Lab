function [y] = lagrange_interpolation(f,x,inp,q)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

n=length(x);
y=0;
if(q==2)
    for i = 1:n
        mult=1;
        for j=1:n
            
            if(j~=i)
                mult=mult*((inp-x(j))/(x(i)-x(j)));
            end
        end
        
        mult=mult*f(x(i));
        y=y+mult;
    end
elseif(q==3)

    for i = 1:n
        mult=1;
        for j=1:n
            
            if(j~=i)
                mult=mult*((inp-x(j))/(x(i)-x(j)));
            end
        end
        
        mult=mult*f(i);
        y=y+mult;
    end


end


end
