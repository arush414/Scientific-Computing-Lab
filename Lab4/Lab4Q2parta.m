syms x1 x2;

f1 = 4*x1*x1 - x2*x2;
f2 = 4*x1*x2*x2-x1-1;

f = [f1; f2] ; % Use array instead of cell array

x = [x1;x2];
x0 = [0; 1];
J = jacobian(f, x);
J_inv= inv(J);
H= J\f;
Nmax=2;
d=1;
epsilon=1e-6;
x_values = zeros(2,Nmax+1);
Residues=zeros(2,Nmax+1);

fprintf("Below Values are up to 8 decimal places\n");
fprintf("Iteration\tX1\t\tX2\t\tH1\t\tH2\t\t|F(x)|\n");

while d<=Nmax+1

    v = double(subs(f,x,x0));

    x_values(1,d)=x0(1);
    x_values(2,d)=x0(2);
   
    sum_value = sum(abs(v));
   

    
    
     if(d==1)
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\t\n", d-1, x0(1), x0(2), abs(x0(1)), abs(x0(2)), sum_value);
        Residues(:,d) = abs(x0);
        x0 =x0- double(subs(J_inv,x,x0))*v;
         
        
    else
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\n", d-1, x0(1), x0(2), abs(x0(1)-x_values(1,d-1)), abs(x0(2)-x_values(2,d-1)),sum_value);

        if(d==Nmax+1)
            Residues(:,d) = abs(x0 - x_values(:,d-1));
            fprintf("Approximate Solution after 2 Iteration comes out to be %.8f %.8f\n", x0(1),x0(2));
            break;

        end

        
        Residues(:,d) = abs(x0 - x_values(:,d-1));
        x0 =x0- double(subs(J_inv,x,x0))*v;
         
       
    end

   
 
    d=d+1;
end



% Plot log residue
figure;


plot(log(1:Nmax+1), log(Residues(1,:)), '-o');
title('Log Residue Plot for x1');
xlabel('Log of Iteration');
ylabel('Log Residue');
grid on;

figure;
plot(log(1:Nmax+1), log(Residues(2,:)), '-o');
title('Log Residue Plot for x2');
xlabel('Log of Iteration');
ylabel('Log Residue');
grid on;




% Plot convergence of x1, x2 with iterations
figure;
plot(0:Nmax, x_values', '-o');
title('Convergence of x1, x2, x3');
xlabel('Iteration');
ylabel('Value');
legend('x1', 'x2');


% Define the grid
[x1, x2] = meshgrid(linspace(-3,3,200), linspace(-3,3,200));

% Calculate function values
f1 = 4.*x1.*x1 - x2.*x2;
f2 = 4.*x1.*x2.*x2 - x1 - 1;

% Plot both functions in the same figure
figure;
mesh(x1, x2, f1);
hold on; % Hold the current plot
mesh(x1, x2, f2);
hold off; % Release the hold
title('Plot of f1 and f2 Functions');
xlabel('x1 values');
ylabel('x2 values');
zlabel('Function values');
legend('f1', 'f2');






