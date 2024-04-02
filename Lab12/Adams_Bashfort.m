function [val,err,max_err] = Adams_Bashfort(f,actual,alpha,h,b,a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n= 1+ (b-a)/h;
val=zeros(n,1);
err=zeros(n,1);
t_values = a:h:b;
val(1)=alpha;
actual_val=actual(t_values);
val(2)=actual_val(2);
val(3)=actual_val(3);
val(4)=actual_val(4);

for i = 5:n
    t=t_values(i);
    y1=val(i-1);
    y2=val(i-2);
    y3=val(i-3);
    y4=val(i-4);
    t1=t_values(i-1);
    t2=t_values(i-2);
    t3=t_values(i-3);
    t4=t_values(i-4);
    val(i)=y1+ (h/24)*(55*f(t1,y1)-59*f(t2,y2)+37*f(t3,y3)-9*f(t4,y4));
    err(i)=abs(actual_val(i)-val(i));
end
max_err=max(err);
end