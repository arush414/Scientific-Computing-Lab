f1 = @(t,y) -2.*y+1;
actual1 = @(t) (exp(-2.*t)+1)./2;
h1=0.1;
value1=1;
a1=0;
b1=1;
t_values=a1:h1:b1;
actual_values=actual1(t_values);
[val1,err1,max_err1]=Euler_explicit(actual1,f1, a1, b1, h1, value1);
[val2,err2,max_err2]=implicit_euler(actual1,f1, a1, b1, h1, value1);
[val3,err3,max_err3]=central_difference(actual1,f1, a1, b1, h1, value1);

fprintf("For explicit Euler\n");
% Print table header
 disp('t        | Actual Value | Approximate Value | Absolute Error');
% Print values line by line
for i = 1:length(t_values)
    fprintf('%8.4f | %12.6f | %17.6f | %14.6f\n', t_values(i), actual_values(i), val1(i), err1(i));
end

fprintf("\nFor implicit Euler\n");
% Print table header
 disp('t        | Actual Value | Approximate Value | Absolute Error');
% Print values line by line
for i = 1:length(t_values)
    fprintf('%8.4f | %12.6f | %17.6f | %14.6f\n', t_values(i), actual_values(i), val2(i), err2(i));
end


fprintf("\nFor Central Difference\n");
% Print table header
 disp('t        | Actual Value | Approximate Value | Absolute Error');
% Print values line by line
for i = 1:length(t_values)
    fprintf('%8.4f | %12.6f | %17.6f | %14.6f\n', t_values(i), actual_values(i), val3(i), err3(i));
end

for N=1:9
    i= 2^(N);
    h=1/i;
    t=a1:h:b1;
    [val1,err1,max_err1]=Euler_explicit(actual1,f1, a1, b1, h, value1);
    [val2,err2,max_err2]=implicit_euler(actual1,f1, a1, b1, h, value1);
    [val3,err3,max_err3]=central_difference(actual1,f1, a1, b1, h, value1);

   
    % Plot absolute errors vs t
    figure;
    plot(t, err1, 'b-', 'LineWidth', 1.5,'DisplayName', 'Explicit Euler');
    hold on;
    plot(t, err2, 'r-', 'LineWidth', 1.5,'DisplayName', 'Implicit Euler');
    hold on;
    plot(t, err3, 'g-', 'LineWidth', 1.5,'DisplayName', 'Central Difference');
    xlabel('t');
    ylabel('Absolute Error');
    title(['Absolute Error vs. t for h = ', num2str(h)]);
    grid on;
   
    
end