fq5 = @(x) 230*(x^4)+18*(x^3)+9*(x^2)-221*x-9;
dfq5 = @(x) 920*(x^3)+54*(x^2)+18*x-221;
epsilon = 1e-6;
Nmax = 10000;
x1 = 0.5;
x2=-0.5;
d = 1;
solution1 = fzero(fq5,0.5);



fprintf("Below Values are up to 8 decimal places for range [0,1] using Newtons method\n");
fprintf("Iteration\tX\t\tf(x)\t\tActual Solution\t\tAbsolute Error\t\t|Xn - Xn-1|\n");

% Initialize arrays to store iteration data for plotting
x_values = zeros(1, Nmax);
fx_values = zeros(1, Nmax);
absolute_errors = zeros(1, Nmax);

while d <= Nmax
    c = fq5(x1);
    dc = dfq5(x1);
    
    % Store values for plotting
    x_values(d) = x1;
    fx_values(d) = c;

    if abs(c) <= epsilon
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, x1, c, solution1, abs(x1 - solution1),abs(x1-x_values(d-1)));
        fprintf("Approximate Solution comes out to be %.8f\n", x1);
        break;
    end
    
    if(d==1)
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, x1, c, solution1, abs(x1 - solution1),abs(x1));
        absolute_errors(d) = abs(x1);
        x1 = x1 - c/dc;
        
    else

        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, x1, c, solution1, abs(x1 - solution1),abs(x1-x_values(d-1)));
        absolute_errors(d) = abs(x1 - x_values(d-1));
        x1 = x1 - c/dc;
        
    end

    d = d + 1;
end

if d == Nmax
    fprintf("For %d iterations, the solution does not converge up to the given error %f\n", Nmax, epsilon);
end




% Figure 1 Plotting the convergence of X values
figure;
plot(1:d, x_values(1:d), '-o', 'Color', 'b', 'LineWidth', 2);
title('Convergence of X values  for range[0,1]');
xlabel('Iteration');
ylabel('X values');
grid on;

% Figure 2 Plotting the convergence of f(X) values
figure;
plot(1:d, fx_values(1:d), '-o', 'Color', 'r', 'LineWidth', 2);
title('Convergence of f(X) values  for range[0,1]');
xlabel('Iteration');
ylabel('f(X) values');
grid on;

% Figure 3 Plotting the absolute error plot
figure;
plot(1:d, absolute_errors(1:d), '-o', 'Color', 'm', 'LineWidth', 2);
title('Residue vs N Plot for range[0,1]');
xlabel('Iteration (N)');
ylabel('Residue (|Xn - Xn-1|)');
grid on;



fprintf("Below Values are up to 8 decimal places for range [-1,0] using Newtons method\n");
fprintf("Iteration\tX\t\tf(x)\t\tActual Solution\t\tAbsolute Error\t\t|Xn - Xn-1|\n");

% Initialize arrays to store iteration data for plotting
x_values = zeros(1, Nmax);
fx_values = zeros(1, Nmax);
absolute_errors = zeros(1, Nmax);
d=1;

while d <= Nmax
    c = fq5(x2);
    dc = dfq5(x2);
    
    % Store values for plotting
    x_values(d) = x2;
    fx_values(d) = c;

    if abs(c) <= epsilon
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, x2, c, solution1, abs(x2 - solution1),abs(x2-x_values(d-1)));
        fprintf("Approximate Solution comes out to be %.8f\n", x2);
        break;
    end
    
    if(d==1)
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, x2, c, solution1, abs(x2 - solution1),abs(x2));
        absolute_errors(d) = abs(x2);
        x2 = x2 - c/dc;
        
    else

        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, x2, c, solution1, abs(x2 - solution1),abs(x2-x_values(d-1)));
        absolute_errors(d) = abs(x2 - x_values(d-1));
        x2 = x2 - c/dc;
        
    end

    d = d + 1;
end

if d == Nmax
    fprintf("For %d iterations, the solution does not converge up to the given error %f\n", Nmax, epsilon);
end

% Figure 1 Plotting the convergence of X values
figure;
plot(1:d, x_values(1:d), '-o', 'Color', 'b', 'LineWidth', 2);
title('Convergence of X values  for range[-1,0]');
xlabel('Iteration');
ylabel('X values');
grid on;

% Figure 2 Plotting the convergence of f(X) values
figure;
plot(1:d, fx_values(1:d), '-o', 'Color', 'r', 'LineWidth', 2);
title('Convergence of f(X) values  for range[-1,0]');
xlabel('Iteration');
ylabel('f(X) values');
grid on;

% Figure 3 Plotting the absolute error plot
figure;
plot(1:d, absolute_errors(1:d), '-o', 'Color', 'm', 'LineWidth', 2);
title('Residue vs N Plot for range[-1,0]');
xlabel('Iteration (N)');
ylabel('Residue (|Xn - Xn-1|)');
grid on;



% Figure 4 Plot of the main function
figure;
x = linspace(-1, 1, 800);
plot(x,230.*(x.^4)+18.*(x.^3)+9.*(x.^2)-221.*x-9,'LineWidth', 2);
title('Plot of the Main Function');
xlabel('X');
ylabel('f(X)');
grid on;




