function [val,err,max_err] = Predictor_Corrector(f,actual,alpha,h,b,a)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[value,error,maxima]=Runge_Kutta_4(actual,f,alpha,h,a,b);
n= 1+ (b-a)/h;
val=zeros(n,1);
err=zeros(n,1);
t_values = a:h:b;
val(1)=value(1);
val(2)=value(2);
val(3)=value(3);
val(4)=value(4);
err(1)=error(1);
err(2)=error(2);
err(3)=error(3);
err(4)=error(4);
actual_val=actual(t_values);
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
    val(i) = y1 + (h/24) * (9*f(t,val(i))+19*f(t1,y1)-5*f(t2,y2)+f(t3,y3));
    err(i)=abs(actual_val(i)-val(i));
end
max_err=max(err);
end