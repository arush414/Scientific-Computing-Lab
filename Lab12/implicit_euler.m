function [ys,err,max_err] = implicit_euler(actual,f, a, b, h, tf)
    num_steps = floor((b - a) / h) + 1;
    ts = zeros(num_steps, 1);
    t_val=a:h:b;
    ys = zeros(num_steps, 1);
    err=zeros(num_steps, 1);
    actual_val=actual(t_val);
    ts(1) = a;
    ys(1) = tf;
    for i = 2:num_steps
        ti = a+ (i - 1) * h;
        tol = 1e-6; 
        max_iter = 10000; 
        yi_prev = ys(i - 1);
        yi_next = yi_prev; % Initial guess
        for iter = 1:max_iter
            yi_next = ys(i - 1) + h * f(ti, yi_next);
            if abs(yi_next - yi_prev) < tol
                break; 
            end
            yi_prev = yi_next; 
        end
        ts(i) = ti;
        ys(i) = yi_next;
        err(i)=abs(ys(i)-actual_val(i));
    end
max_err=max(err);
end
