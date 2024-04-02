function [] = plotting(actual_values,y_values,err,t_values,order,ordermax)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Evaluate actual solutions


% Plot actual solutions and approximate solutions vs t
figure;
plot(t_values, actual_values, 'k-', 'LineWidth', 2, 'DisplayName', 'Actual Solution');
hold on;
plot(t_values, y_values, 'b--', 'LineWidth', 1.5, 'DisplayName','Approx');
xlabel('t');
ylabel('y(t)');
title('Actual And Approximate Solutions');
legend('Location', 'Best');
grid on;


% Plot absolute errors vs t
figure;
plot(t_values, err, 'b-', 'LineWidth', 1.5);
xlabel('t');
ylabel('Absolute Error');
title('Absolute Error vs. t');
grid on;

N = [4, 8, 16, 32, 64, 128,256,512];

ratio_a = order(2:end) ./ order(1:end-1);


% Take the logarithm base 2 of the ratios
log2_ratio_a = -(log2(ratio_a));


figure;
plot(N, log2_ratio_a, 'ro-', 'LineWidth', 2);
xlabel('N');
ylabel('Order');
title('N vs Order');


figure;
plot(log(N(1:8)), log(abs(ordermax(1:8))), 'bo-');
xlabel('N');
ylabel('Abs Error');
title('loglog plot of N vs Abs Error');

    

  

end