x =[1.0 ,1.5, 2.0, 2.5];
f=[ 2.7183,4.4817,7.3819,12.1825];
h = x(2) - x(1);
g = @(x) exp(x);
n=length(x);
inp=2.25;
[approx_value,diff_table] = backward_interpolation(inp,x,f);


% Display the result
fprintf('\nThe actual value of f(2.25) is: %.8f\n', g(2.25));
fprintf('The approximate value of f(2.25) is: %.8f\n', approx_value);

actual=zeros(1000);
interpol=zeros(1000);

z= linspace(1,3,1000);
for i =1:1000
    [interpol(i),diff_table]= backward_interpolation(z(i),x,f);
    actual(i)=g(z(i));

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