function [approx_value] = Composite_midpoint(f, lower_lim, upper_lim, n)


approx_value = 0;


interval = (upper_lim - lower_lim) / n;


l = zeros(1, n+1);


l(1) = lower_lim;
for j = 2:n+1
    l(j) = l(j-1) + interval;
end


for j = 1:n
   
    midpoint = (l(j) + l(j+1)) / 2;
    
   
    approx_value = approx_value + f(midpoint) * interval;
end

end
