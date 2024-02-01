p0=-0.5;
p1=0;
p2=0.5;
f= @(x) x^4 -3*(x^3)+ x^2 + x + 1;

epsilon= 1e-5;
Nmax= 10000;
h1= p1-p0;
h2=p2-p1;
DELTA1 = (f(p1) - f(p0))/h1;
DELTA2 = (f(p2) - f(p1))/h2;
d = (DELTA2 - DELTA1)/(h2 + h1);
i=3;
solution =  -0.339092837761710 - 0.446630099997518i;
fprintf("Below Values are up to 8 decimal places\n");
fprintf("Iteration\t\t  X\t\t\t  f(x)\t\t\t\tActual Solution\t\t\tAbsolute Error\t\tResidue\n");
x_values = zeros(1, Nmax);
fx_values = zeros(1, Nmax);
absolute_errors = zeros(1, Nmax);

while i<=Nmax

    b = DELTA2 + h2*d;
    D = (b.^2 - 4*f(p2).*d).^(1/2);
    if abs(b-D) < abs(b+D)

        E = b + D;
    else
        E = b - D;
    end
    h = -2*f(p2)/E;
    p = p2 + h;
    
    if(abs(f(p))<=epsilon)
        x_values(i-2)=p;
        fx_values(i-2)=abs(f(p));
        if(i-2==1)
            absolute_errors(i-2)= log(abs((x_values(i-2))));
        else
            absolute_errors(i-2)= log(abs((x_values(i-2)-x_values(i-3))));

        end
        formatString = '%d\t\t%.8f + %.8fi\t%.8f + %.8fi\t%.8f + %.8fi\t%.8f\t\t%.8f\n';
        fprintf(formatString, i-2, real(p), imag(p), real(f(p)), imag(f(p)), real(solution), imag(solution), abs(p - solution), abs(p - x_values(i-3)));
        fprintf("Approximate Solution comes out to be %.8f + %.8fi\n", real(p),imag(p));
        break
    end

    po=p1;
    p1=p2;
    p2=p;
    h1= p1-p0;
    h2=p2-p1;
    DELTA1 = (f(p1) - f(p0))/h1;
    DELTA2 = (f(p2) - f(p1))/h2;
    d = (DELTA2 - DELTA1)/(h2 + h1);
    formatString = '%d\t\t%.8f + %.8fi\t%.8f + %.8fi\t%.8f + %.8fi\t%.8f\t\t%.8f\n';
    if(i==3)
        fprintf(formatString, i-2, real(p), imag(p), real(f(p)), imag(f(p)), real(solution), imag(solution), abs(p - solution), abs(p));
    else
        fprintf(formatString, i-2, real(p), imag(p), real(f(p)), imag(f(p)), real(solution), imag(solution), abs(p - solution), abs(p-x_values(i-3)));
    end
    x_values(i-2)=p;
    fx_values(i-2)=abs(f(p));
    if(i-2==1)
        absolute_errors(i-2)= log(abs((x_values(i-2))));
    else
        absolute_errors(i-2)= log(abs((x_values(i-2)-x_values(i-3))));

    end
    i=i+1;
end

if i>=Nmax
    fprintf("For %d iterations, the solution does not converge up to the given error %f\n", Nmax, epsilon);
end

d=i-2;

figure;
plot(1:d, abs(x_values(1:d)), '-o', 'Color', 'b', 'LineWidth', 2);
title('Convergence of X values');
xlabel('Iteration');
ylabel('X values');
grid on;

% Figure 2 Plotting the convergence of f(X) values
figure;
plot(1:d, abs(fx_values(1:d)), '-o', 'Color', 'r', 'LineWidth', 2);
title('Convergence of f(X) values');
xlabel('Iteration');
ylabel('f(X) values');
grid on;

% Figure 3 Plotting the absolute error plot
figure;
plot(log(1:d), absolute_errors(1:d), '-o', 'Color', 'm', 'LineWidth', 2);
title('loglog plot of Residue vs N Plot');
xlabel('Log of Iteration (N)');
ylabel('Log of Relative Residue (|Xn - Xn-1|)');
grid on;

% Figure 4 Plot of the main function
figure;
x = linspace(-2,4, 2000);
plot(x,x.^4 -3.*(x.^3)+ x.^2 + x + 1,'LineWidth', 2);
title('Plot of the Main Function');
xlabel('X');
ylabel('f(X)');
grid on;



