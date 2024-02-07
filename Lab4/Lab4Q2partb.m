
syms x y;

f1 = 1+x*x-y*y+cos(y)*exp(x);
f2 = 2*x*y+sin(y)*exp(x);

f = [f1; f2] ; % Use array instead of cell array

x = [x;y];
x0 = [-1; 4];
J = jacobian(f, x);
J_inv= inv(J);
H= J\f;
Nmax=5;
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
            fprintf("Approximate Solution after 5 Iteration comes out to be %.8f %.8f\n", x0(1),x0(2));
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
title('Log Residue Plot for x');
xlabel('Log of Iteration');
ylabel('Log Residue');
grid on;

figure;
plot(log(1:Nmax+1), log(Residues(2,:)), '-o');
title('Log Residue Plot for y');
xlabel('Log of Iteration');
ylabel('Log Residue');
grid on;




% Plot convergence of x1, x2 with iterations
figure;
plot(0:Nmax, x_values', '-o');
title('Convergence of x,y');
xlabel('Iteration');
ylabel('Value');
legend('x', 'y');

% Define the grid
[x, y] = meshgrid(linspace(-3,3,200), linspace(-3,3,200));

% Calculate function values
f1 = 1 + x.*x - y.*y + cos(y).*exp(x);
f2 = 2.*x.*y + sin(y).*exp(x);

% Plot both functions in the same figure
figure;
mesh(x, y, f1);
hold on; % Hold the current plot
mesh(x, y, f2);
hold off; % Release the hold
title('Plot of f1 and f2 Functions');
xlabel('x values');
ylabel('y values');
zlabel('Function values');
legend('f1', 'f2');




