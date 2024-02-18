g = @(x) 1./(1+x.*x);

Main_table = zeros(3,10);

for n = 1:10

    h = 10/n;
    f = zeros(1, n+1);
    x = zeros(1, n+1);
    for i = 0:n
        x(i+1) = -5 + i*h;
        f(i+1) = g(x(i+1));
    end

    [approx_value1, diff_table1] = forward_interpolation(1 + sqrt(10), x, f);
    [approx_value2, diff_table2] = backward_interpolation(1 + sqrt(10), x, f);
    approx_value3 = lagrange_interpolation(f, x, 1 + sqrt(10),3);

    Main_table(1,n) = approx_value1;
    Main_table(2,n) = approx_value2;
    Main_table(3,n) = approx_value3;
    
    % Plotting
    figure;
   
    xx = linspace(-5, 5, 1000);
    
    yy1 = zeros(size(xx));
    yy2 = zeros(size(xx));
    yy3 = zeros(size(xx));
    pp = g(xx); % Evaluate actual function values
    plot(xx, pp, 'r-', 'LineWidth', 1.5); % Actual function
    hold on;
    for i = 1:length(xx)
        [yy1(i),table1] = forward_interpolation(xx(i), x, f);
        [yy2(i),table2] = backward_interpolation(xx(i), x, f);
        yy3(i) = lagrange_interpolation(f, x, xx(i), 3);
    end
   
    plot(xx, yy3, 'm--', 'LineWidth', 1.5); % Lagrange interpolation
    legend('Actual', 'Lagrange Interpolation');
    title(['Interpolation for n = ', num2str(n)]);
    xlabel('x');
    ylabel('f(x)');
    hold off;

end

% Printing main table
fprintf('Main Table:\n');
fprintf('%10s %15s %15s %15s\n', 'n', 'Forward', 'Backward', 'Lagrange');
for i = 1:size(Main_table, 2)
    fprintf('%10d %15.10f %15.10f %15.10f\n', i, Main_table(1,i), Main_table(2,i), Main_table(3,i));
end
