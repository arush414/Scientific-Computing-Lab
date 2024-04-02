function [val,err,max_err] = Euler_explicit(actual,f, a, b, h, tf)

num_steps = floor((b - a) / h) + 1;
t_val=a:h:b;
val = zeros(num_steps, 1);
err=zeros(num_steps, 1);
actual_val=actual(t_val);
val(1) = tf;
for i = 1:num_steps-1
    val(i + 1) = val(i) + h * f(t_val(i), val(i));
    err(i+1)=abs(val(i+1)-actual_val(i+1));
end
max_err = max(err);

end
