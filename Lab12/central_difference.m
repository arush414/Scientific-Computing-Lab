function [val,err,max_err]= central_difference(actual,f, a, b, h, tf)

num_steps = floor((b - a) / h) + 1;
t_val=a:h:b;
val = zeros(num_steps, 1);
err=zeros(num_steps, 1);
actual_val=actual(t_val);
val(1) = tf;
val(2)=actual_val(2);
for i = 2:num_steps-1
    val(i+1) = val(i-1) + 2*f(t_val(i),val(i))*h;
    err(i+1)=abs(actual_val(i+1)-val(i+1));
end
max_err = max(err);
end
