syms x1 x2 x3;

f1 = 6*x1  - 2*cos(x2*x3) - 1;
f2 = 9*x2+ (x1*x1+sin(x3)+1.06)^(0.5)+0.9;
f3 = 60*x3+3*exp(-x1*x2)+10*pi-3;
f = [f1; f2; f3] ; % Use array instead of cell array

x = [x1;x2;x3];
x0 = [0; 0; 0];
J = jacobian(f, x);
J_inv= inv(J);
H= J\f;
Nmax=10000;
d=1;
epsilon=1e-6;
x_values = zeros(3,Nmax+1);
Residues=zeros(3,Nmax+1);

fprintf("Below Values are up to 8 decimal places\n");
fprintf("Iteration\tX1\t\tX2\t\tX3\t\tH1\t\tH2\t\tH3\t\t|F(x)|\n");

while d<=Nmax+1

    v = double(subs(f,x,x0));

    x_values(1,d)=x0(1);
    x_values(2,d)=x0(2);
    x_values(3,d)=x0(3);
    sum_value = sum(abs(v));
   

    


    if(d==1)
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\n", d-1, x0(1), x0(2), x0(3), abs(x0(1)), abs(x0(2)), abs(x0(3)), sum_value);
        Residues(:,d) = abs(x0);
        x0 =x0- double(subs(J_inv,x,x0))*v;
         
        
    else
        fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\n", d-1, x0(1), x0(2), x0(3), abs(x0(1)-x_values(1,d-1)), abs(x0(2)-x_values(2,d-1)), abs(x0(3)-x_values(3,d-1)), sum_value);
        
        Residues(:,d) = abs(x0 - x_values(:,d-1));
        x0 =x0- double(subs(J_inv,x,x0))*v;
         
       
    end
     
    
    if d > 1 && max(abs(Residues(:, d))) <= epsilon


        fprintf("Approximate Solution comes out to be %.8f %.8f %.8f\n", x0(1),x0(2),x0(3));
        break;

    end
 
    d=d+1;
end



% Plot log residue
figure;


plot(log(1:d), log(Residues(1,1:d)), '-o');
title('Log Residue Plot for x1');
xlabel('Log of Iteration');
ylabel('Log Residue');
grid on;

figure;
plot(log(1:d), log(Residues(2,1:d)), '-o');
title('Log Residue Plot for x2');
xlabel('Log of Iteration');
ylabel('Log Residue');
grid on;

figure;
plot(log(1:d), log(Residues(3,1:d)), '-o');
title('Log Residue Plot for x3');
xlabel('Log of Iteration');
ylabel('Log Residue');
grid on;


% Plot convergence of x1, x2, x3 with iterations
figure;
plot(1:d, x_values(:,1:d)', '-o');
title('Convergence of x1, x2, x3');
xlabel('Iteration');
ylabel('Value');
legend('x1', 'x2', 'x3');



