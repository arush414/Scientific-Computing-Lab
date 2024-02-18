x =[1.0 ,1.5, 2.0, 2.5];
f=[ 2.7183,4.4817,7.3819,12.1825];
h = x(2) - x(1);
g = @(x) exp(x);
inp=2.25;
n=length(x);
[approx_value,diff_table] = forward_interpolation(inp,x,f);

fprintf("forward interpolating table is given below\n");
for i = 1:n
    fprintf('%.2f\t%.4f\t', x(i), diff_table(i,1));
    for j = 2:n-i+1
        fprintf('%.4f\t', diff_table(i,j));
    end
    fprintf('\n');
end
% Display the result
fprintf('\n\nThe actual value of f(2.25) is: %.8f\n', g(2.25));
fprintf('The approximate value of f(2.25) is: %.8f\n', approx_value);

actual=zeros(1000);
interpol=zeros(1000);

z= linspace(1,3,1000);
for i =1:1000
    [actual(i),diff_table]= forward_interpolation(z(i),x,f);
    interpol(i)=g(z(i));

end

figure;
plot(z, actual, 'LineWidth', 2);
hold on;
plot(z, interpol, 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Actual Function vs Interpolated Function');
legend('Actual Function', 'Interpolated Function');
grid on;
hold off;