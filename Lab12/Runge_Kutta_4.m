function [val,err,max_err] = Runge_Kutta_4(actual,f,value,h,a,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=((b-a)/h) +1;
val=zeros(n,1);
val(1)=value;
err=zeros(n,1);
t_values = a:h:b;
actual_val=actual(t_values);
for i = 1:n-1
    y=val(i);
    t=t_values(i);
    k1=h*f(t,y);
    k2=h*f(t+h/2,y+(1/2)*k1);
    k3=h*f(t+h/2,y+(1/2)*k2);
    k4=h*f(t+h,y+k3);
    val(i+1)= y+ k1/6 +k2/3 + k3/3 +k4/6;
    err(i+1)=abs(actual_val(i+1)-val(i+1));
end
max_err=max(err);
end