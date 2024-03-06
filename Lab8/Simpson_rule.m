function [approx_area] = Simpson_rule(func,lower_lim,upper_lim)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
approx_area= ((upper_lim - lower_lim)/6 * (func(lower_lim)+func(upper_lim)+ 4* func((lower_lim+upper_lim)/2)));
fprintf("Approx Value of integral using Simpsons 1/3rd rule comes out to be %.5f\n\n",approx_area);
end