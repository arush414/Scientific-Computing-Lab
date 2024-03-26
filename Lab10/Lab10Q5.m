f = @(y,t) -y+t+1;


actualsol= @(t) t+exp(-t);


for K=[0.05,0.1,0.2]


    h = K;
    t = 0:h:5;
    
    
    y = zeros(size(t));
    
    
    y(1)=1;
    
    for i = 1:length(t)-1
        y(i + 1) = y(i) + h * f(y(i), t(i));
    end
    
    
    
    
    % Evaluate exact solution function handles at points defined by ta, tb, tc
    y_exact_values = actualsol(t);
    
    
    
    % Calculate absolute errors
    error = abs(y_exact_values - y);
     figure;
    plot(t, y, 'b-', 'LineWidth', 2, 'DisplayName', 'Approximation');
    hold on;
    plot(t, y_exact_values, 'r-', 'LineWidth', 2, 'DisplayName', 'Exact Solution');
    xlabel('t');
    ylabel('Solution');
    title('x vs Solution');
    grid on;
    legend('Location', 'best');
     figure;
        plot(t, error, 'r', 'LineWidth', 2);
        xlabel('t');
        ylabel('Absolute Error');
        title('Absolute Error of Approximations');
        grid on; 
     
end
ordera=zeros(1,9);
ordermax=zeros(1,9);
for N=1:9

    h = 5/2^N;
    t = 0:h:5;
    
    
    y = zeros(size(t));
    
    
    y(1)=1;
    
    for i = 1:length(t)-1
    
        y(i + 1) = y(i) + h * f(y(i), t(i));
    end
    

    
    
    % Evaluate exact solution function handles at points defined by ta, tb, tc
    y_exact_values = actualsol(t);
    
    
    
    % Calculate absolute errors
    error = abs(y_exact_values - y);
    ordera(N)=error(end);
    ordermax(N)=max(error);


end
N = [2, 4, 8, 16, 32, 64, 128,256];

% Calculate the ratio between successive elements in ordera, orderb, and orderc
ratio_a = ordera(2:end) ./ ordera(1:end-1);



% Take the logarithm base 2 of the ratios
log2_ratio_a = -(log2(ratio_a));

fprintf('N \t E(N) \t Order\n');
for j=1:8
    fprintf('%d \t %.4f \t %.4f\n',2^j,ordera(j),log2_ratio_a(j));
end
% Convert symbolic expressions to function handles


% Plot
figure;
plot(N, log2_ratio_a, 'r-', 'LineWidth', 2);
xlabel('N');
ylabel('Order');
title('N vs Order');
grid on;

% Plot
figure;
loglog(N(1:8), abs(ordermax(1:8)));
xlabel('N');
ylabel('Abs Error');
title('loglog plot of N vs Abs Error');
grid on;


