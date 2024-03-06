function [approx_area] = Rectangle_rule(func,lower_lim,upper_lim)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
approx_area= (func(lower_lim)*(upper_lim-lower_lim));
fprintf("Approx value of integral using Rectangle rule comes out to be %.5f\n\n",approx_area);
end
