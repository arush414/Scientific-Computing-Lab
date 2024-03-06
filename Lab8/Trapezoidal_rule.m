function [approx_area] = Trapezoidal_rule(func,lower_lim,upper_lim)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
approx_area= ((upper_lim-lower_lim)*((func(upper_lim)+func(lower_lim))/2));
fprintf("Approx Value of integral using Trapezoidal rule comes out to be %.5f\n\n",approx_area);
end