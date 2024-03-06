function [approx_value] = Composite_trapezoidal(func, lower_lim, upper_lim, Ques,num)
% Composite Trapezoidal Rule
% func: function to be integrated
% lower_lim: lower limit of integration
% upper_lim: upper limit of integration
% Ques: specifies which part of the question to evaluate



if Ques == 4

    n = length(func);
    h = (upper_lim - lower_lim)/(n-1);
    approx_value = func(1) + func(n);
    for i = 2:n-1
        approx_value = approx_value + 2 * func(i);
    end
    approx_value = approx_value * (h/2);
end

if Ques == 5
    approx_value = func(lower_lim) + func(upper_lim);
    h = (upper_lim - lower_lim)/(num-1);
    for i = 2:num-1
        approx_value = approx_value + 2 * func(lower_lim + (i-1)*h);
    end
    approx_value = approx_value * (h/2);
end

end
