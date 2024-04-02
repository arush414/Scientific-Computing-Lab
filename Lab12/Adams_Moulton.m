function [val,err,max_err] = Adams_Moulton(f,actual,alpha,h,b,a)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n= 1+ (b-a)/h;
val=zeros(n,1);
err=zeros(n,1);
val(1)=alpha;
t_values = a:h:b;
actual_val=actual(t_values);
val(2)=actual_val(2);
val(3)=actual_val(3);
for i = 4:n
    t=t_values(i);
    y1=val(i-1);
    y2=val(i-2);
    y3=val(i-3);
    t1=t_values(i-1);
    t2=t_values(i-2);
    t3=t_values(i-3);
    tol = 1e-12; 
    max_iter = 10000; 
    yi_prev = val(i - 1);
    wi=yi_prev;
    yi_next = yi_prev; % Initial guess
    for iter = 1:max_iter
        yi_next = wi + (h/24) * (9*f(t,yi_prev)+19*f(t1,y1)-5*f(t2,y2)+f(t3,y3));
        if abs(yi_next - yi_prev) < tol
            break; 
        end
        yi_prev = yi_next; 
    end
    val(i)=yi_prev;
    err(i)=abs(actual_val(i)-val(i));
end
max_err=max(err);


end