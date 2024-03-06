function [approx_area] = Simpson_rule_threeeight(func,lower_lim,upper_lim)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
interval= (upper_lim-lower_lim)/3;
x1= interval+ lower_lim;
x2= 2*interval+ lower_lim;
approx_area= 3*interval/8 * (func(lower_lim)+3*func(x1)+3*func(x2)+func(upper_lim));
fprintf("Approx area using Simpsons 3/8th rule comes out to be %.5f\n\n",approx_area);
end