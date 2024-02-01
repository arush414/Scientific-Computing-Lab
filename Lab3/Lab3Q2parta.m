fq2a = @(x) x^4 -8*(x^2)-x+16;
dfq2a= @(x) 4*(x^3)-16*x -1;
dfdfq2a= @(x) 12*(x^2)-16;
epsilon = 1e-5;
Nmax=10000;
x= 1.5;
d=1;
solution = fzero(fq2a,1.5);



fprintf("Below Values are up to 8 decimal places\n");
fprintf("Iteration\tX\t\tf(x)\t\tActual Solution\t\tAbsolute Error\t\tResidue\n");

% Initialize arrays to store iteration data for plotting
x_values = zeros(1, Nmax);
fx_values = zeros(1, Nmax);
absolute_errors = zeros(1, Nmax);

while d <= Nmax
    c = fq2a(x);
    dc = dfq2a(x);
    dcdc=dfdfq2a(x);
    
    % Store values for plotting
    x_values(d) = x;
    fx_values(d) = c;

    if(d==1)
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, x, c, solution, abs(x -solution),abs(x));
        absolute_errors(d) = abs(x);
        x = x- (c*dc)/((dc)^2 - c*(dcdc));
        
    else

        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, x, c, solution, abs(x -solution),abs(x-x_values(d-1)));
        absolute_errors(d) = abs(x - x_values(d-1));
        x = x- (c*dc)/((dc)^2 - c*(dcdc));
       
    end

    if abs(c) <= epsilon
        
        fprintf("Approximate Solution comes out to be %.8f\n", x);
        break;
    end

    d = d + 1;
end

if d == Nmax
    fprintf("For %d iterations, the solution does not converge up to the given error %f\n", Nmax, epsilon);
end

% Figure 1 Plotting the convergence of X values
figure;
plot(1:d, x_values(1:d), '-o', 'Color', 'b', 'LineWidth', 2);
title('Convergence of X values');
xlabel('Iteration');
ylabel('X values');
grid on;

% Figure 2 Plotting the convergence of f(X) values
figure;
plot(1:d, fx_values(1:d), '-o', 'Color', 'r', 'LineWidth', 2);
title('Convergence of f(X) values');
xlabel('Iteration');
ylabel('f(X) values');
grid on;

% Figure 3 Plotting the absolute error plot
figure;
plot(log(1:d), log(absolute_errors(1:d)), '-o', 'Color', 'm', 'LineWidth', 2);
title('loglog plot of Residue vs N Plot');
xlabel('log of Iteration (N)');
ylabel('log of Residue (|Xn - Xn-1|)');
grid on;

% Figure 4 Plot of the main function
figure;
x = linspace(1, 3, 500);
plot(x,x.^4 -8.*(x.^2)-x+16,'LineWidth', 2);
title('Plot of the Main Function');
xlabel('X');
ylabel('f(X)');
grid on;





