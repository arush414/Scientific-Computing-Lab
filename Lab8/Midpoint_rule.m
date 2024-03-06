function [approx_area] = Midpoint_rule(func,lower_lim,upper_lim)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
approx_area= (func((lower_lim+upper_lim)/2)*(upper_lim-lower_lim));
fprintf("Approx Value of integral using Midpoint rule comes out to be %.5f\n\n",approx_area);
end