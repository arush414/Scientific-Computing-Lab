f = @(x) sin(log(x));
x = [2, 2.4, 2.6];


n = length(x);

z = linspace(1.5, 3.5, 1000);
func = zeros(1, 1000);
actual_func = zeros(1, 1000);

for i = 1:1000
    func(i) = lagrange_interpolation(f, x, z(i),2);
    actual_func(i) = f(z(i));
end

% Plot for actual function and interpolated function
figure;
plot(z, actual_func, 'LineWidth', 2);
hold on;
plot(z, func, 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Actual Function vs Interpolated Function');
legend('Actual Function', 'Interpolated Function');
grid on;
hold off;

% Calculate and plot absolute error
figure;

z = linspace(2, 2.6, 1000);
for i = 1:1000
    func(i) = lagrange_interpolation(f, x, z(i),2);
    actual_func(i) = f(z(i));
end

abs_error = abs(actual_func - func);
max_abs_error = max(abs_error);


plot(z, abs_error, 'LineWidth', 2);
xlabel('x');
ylabel('Absolute Error');
title('Absolute Error');
grid on;

fprintf('Maximum absolute error in range of [2,2.6] is : %.8f\n', max_abs_error);

