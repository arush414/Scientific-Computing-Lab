x =[-0.75 ,-0.5, -0.25, 0];
f=[ -0.07181250,-0.02475000,0.33493750,1.10100000];
h = x(2) - x(1);

inp=-0.33333;

for j = 1:3
    n=j;
    x_cut=x(1:j+1);
    f_cut= f(1:j+1);
    [approx_value,diff_table] = forward_interpolation(inp,x_cut,f_cut);
    
    fprintf("Forward interpolating table for degree %d is given below\n", j);
    for i = 1:j
        fprintf('%.2f\t%.4f\t', x(i), diff_table(i,1));
        for  u= 2:j-i+1
            fprintf('%.4f\t', diff_table(i,u));
        end
        fprintf('\n');
    end
    % Display the result
    
    fprintf('\nThe approximate value of f(0.43) using interpolating polynomial of degree %d : %.8f\n\n', j,approx_value);
    
    
    interpol=zeros(1000);
    
    z= linspace(1,3,1000);
    for i =1:1000
        [interpol(i),diff_table]= forward_interpolation(z(i),x_cut,f_cut);
        
    
    end
    
    figure;
    plot(z, interpol, 'LineWidth', 2);
    xlabel('x');
    ylabel('y');
    title(['X vs Interpolated Function of Degree ' num2str(j)]);
    grid on;
   
end