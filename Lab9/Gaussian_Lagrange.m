function [val] = Gaussian_Lagrange(f,n,a,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h=(b-a)/(n-1);
if n==2
    val= (h/2)*(f(a)+f(b));
elseif n==3
    val= (h/3)*(f(a)+f(b)+4*f(a+h));
elseif n==4
    val= (3*h/8)*(f(a)+3*f(a+h)+3*f(a+2*h)+f(b));
elseif n==5
    val= (2*h/45)*(7*f(a)+32*f(a+h)+12*f(a+2*h)+32*f(a+3*h)+7*f(b));
end