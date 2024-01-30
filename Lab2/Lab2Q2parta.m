a=1/2;
b=3/2;
epsilon = 1e-5;
Nmax=10000;
fq2a = @(x) 2+ cos(exp(x) -2) - exp(x);
solution = fzero(fq2a,1/2);
fa=fq2a(a);
fb = fq2a(b);

fprintf("Below Values are up to 8 decimal places\n");
fprintf("Iteration\tX\t\tf(x)\t\tActual Solution\t\tAbsolute Error\t\tResidue\n");

x_values = zeros(1, Nmax);
fx_values = zeros(1, Nmax);
absolute_errors = zeros(1, Nmax);


for d = 1:Nmax
    if fa*fb<0
        c =(a+b)/2;
        fc= fq2a(c);
        x_values(d)=c;
        fx_values(d)=fc;

        if(d==1)
            absolute_errors(d)=abs(c);
        else
            absolute_errors(d)=abs(c-x_values(d-1));
        end


        if(abs(fc)<= epsilon)
            fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, c, fc, solution, abs(c -solution),absolute_errors(d));
            fprintf('Approximate Solution comes out to be %.8f\n',c);
            
            break;
        end
        if fc*fa < 0
            fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, c, fc, solution, abs(c -solution),absolute_errors(d));
            b=c;
        else
            fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t\t%.8f\n", d, c, fc, solution, abs(c -solution),absolute_errors(d));
            a=c;
        end

    else
        if fa*fb>0
            disp('From the initial values a and b given we cannot find the root using bisection method');
            break;
        elseif fa==0
            fprintf('Exact Solution comes out to be %.6f\n',a);
            
            break;
        else
            fprintf('Exact Solution comes out to be %.6f\n',b);
            break;
         
        end
               
                
    end


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
plot(1:d, absolute_errors(1:d), '-o', 'Color', 'm', 'LineWidth', 2);
title('Residue vs N Plot');
xlabel('Iteration (N)');
ylabel('Residue (|Xn - Xn-1|)');
grid on;

% Figure 4 Plot of the main function
figure;
x = linspace(-2, 2, 800);
plot(x,2+ cos(exp(x) -2) - exp(x),'LineWidth', 2);
title('Plot of the Main Function');
xlabel('X');
ylabel('f(X)');
grid on;



