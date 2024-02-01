fq2b = @(x) exp(6*x)+(3*(log(2))^2)*exp(2*x)- exp(4*x)*(log(8))- (log(2))^3;
dfq2b= @(x) 6*exp(6*x)+(6*(log(2))^2)*exp(2*x)- exp(4*x)*(log(8))*4;
dfdfq2b= @(x) 36*exp(6*x)+(12*(log(2))^2)*exp(2*x)- exp(4*x)*(log(8))*16;
epsilon = 1e-5;
Nmax=10000;
x= -0.5;
d=1;
solution = fzero(fq2b,-0.5);



fprintf("Below Values are up to 8 decimal places\n");
fprintf("Iteration\tX\t\tf(x)\t\tActual Solution\t\tAbsolute Error\t\tResidue\n");

% Initialize arrays to store iteration data for plotting
x_values = zeros(1, Nmax);
fx_values = zeros(1, Nmax);
absolute_errors = zeros(1, Nmax);

while d <= Nmax
    c = fq2b(x);
    dc = dfq2b(x);
    dcdc=dfdfq2b(x);
    
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
x = linspace(-1, 0, 3000);
plot(x,exp(6.*x)+(3.*(log(2)).^2).*exp(2.*x)- exp(4.*x).*(log(8))- (log(2))^3,'LineWidth', 2);
title('Plot of the Main Function');
xlabel('X');
ylabel('f(X)');
grid on;





