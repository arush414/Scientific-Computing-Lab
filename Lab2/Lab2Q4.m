fq4 = @(x) exp(-1/(x^2));
dfq4= @(x) exp(-1/(x^2))*(2/(x^3));
epsilon = eps;
Nmax=10000;
x= 0.0001;
d=1;
solution=0;
%solution = fzero(fq4,2);
fprintf("Value is %.6fd\n",exp(10^8)*epsilon);

fprintf("Below Values are up to 14 decimal places\n");
fprintf("Iteration\tX\t\tf(x)\t\tActual Solution\t\tAbsolute Error\n");

% Initialize arrays to store iteration data for plotting
x_values = zeros(1, Nmax);
fx_values = zeros(1, Nmax);
absolute_errors = zeros(1, Nmax);

while d <= Nmax
    c = fq4(x);
    dc = dfq4(x);
    
    % Store values for plotting
    x_values(d) = x;
    fx_values(d) = c;

    
    if(d==1)
        fprintf("%d\t\t%.14f\t%.14f\t%.14f\t%.14f\n", d, x, c, solution, abs(x-solution));
        x = x - (x^3)/2;
        absolute_errors(d) = abs(x);
    else

        fprintf("%d\t\t%.14f\t%.14f\t%.14f\t%.14f\n", d, x, c, solution, abs(x - solution));
        x = x - (x^3)/2;
        absolute_errors(d) = abs(x - x_values(d-1));
    end

    d = d + 1;
end

if d == Nmax
    fprintf("For %d iterations, the solution does not converge up to the given error %f\n", Nmax, epsilon);
end

% Figure 1 Plotting the convergence of X values
figure;
plot(1:d-1, x_values(1:d-1), '-o', 'Color', 'b', 'LineWidth', 2);
title('Convergence of X values');
xlabel('Iteration');
ylabel('X values');
grid on;

% Figure 2 Plotting the convergence of f(X) values
figure;
plot(1:d-1, fx_values(1:d-1), '-o', 'Color', 'r', 'LineWidth', 2);
title('Convergence of f(X) values');
xlabel('Iteration');
ylabel('f(X) values');
grid on;

% Figure 3 Plotting the absolute error plot
figure;
plot(2:d-1, absolute_errors(2:d-1), '-o', 'Color', 'm', 'LineWidth', 2);
title('Residue vs N Plot');
xlabel('Iteration (N)');
ylabel('Residue (|Xn - Xn-1|)');
grid on;

% Figure 4 Plot of the main function
figure;
x = linspace(-1, 1, 5000);
plot(x,exp(-1./(x.^2)),'LineWidth', 2);
title('Plot of the Main Function');
xlabel('X');
ylabel('f(X)');
grid on;



