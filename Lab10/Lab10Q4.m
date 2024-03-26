fa = @(y,t) 1+y/t;
fb = @(y,t) cos(2*t)+sin(3*t);
fc = @(y,t) -y+t*sqrt(y);

% Define symbolic solutions
syms acta(t)
odea = diff(acta,t) == 1 + acta/t;
conda = acta(1) == 2;
ySola(t) = dsolve(odea, conda);

syms actb(t)
odeb = diff(actb,t) == cos(2*t) + sin(3*t);
condb = actb(0) == 1;
ySolb(t) = dsolve(odeb, condb);

syms actc(t)
odec = diff(actc,t) == -actc + t*sqrt(actc);
condc = actc(2) == 2;
ySolc(t) = dsolve(odec, condc);

ordera=zeros(1,9);
orderb=zeros(1,9);
orderc=zeros(1,9);
ordermaxa=zeros(1:9);
ordermaxb=zeros(1:9);
ordermaxc=zeros(1:9);
for N=1:9
    i= 2^N;
    h = 1/i;
    ta = 1:h:2;
    tb = 0:h:1;
    tc = 2:h:3;
    
    ya = zeros(size(ta));
    yb = zeros(size(tb));
    yc = zeros(size(tc));
    
    ya(1)=2;
    yb(1)=1;
    yc(1)=2;
    for i = 1:length(ta)-1
        ya(i + 1) = ya(i) + h * fa(ya(i), ta(i));
    end
    
    for i = 1:length(tb)-1
        yb(i + 1) = yb(i) + h * fb(yb(i), tb(i));
    end
    
    for i = 1:length(tc)-1
        yc(i + 1) = yc(i) + h * fc(yc(i), tc(i));
    end
    y_exact_a_func = matlabFunction(ySola);
    y_exact_b_func = matlabFunction(ySolb);
    y_exact_c_func = matlabFunction(ySolc);
    
    
    % Evaluate exact solution function handles at points defined by ta, tb, tc
    y_exact_a_values = y_exact_a_func(ta);
    
    y_exact_b_values = y_exact_b_func(tb);
    
    y_exact_c_values = y_exact_c_func(tc);
    y_exact_c_values=y_exact_c_values(2,:);
    
    
    % Calculate absolute errors
    error_a = abs(y_exact_a_values - ya);
    error_b = abs(y_exact_b_values - yb);
    error_c = abs(y_exact_c_values - yc);
    ordera(N)=error_a(end);
    orderb(N)=error_b(end);
    orderc(N)=error_c(end);
    ordermaxa(N)=max(error_a);
    ordermaxb(N)=max(error_b);
    ordermaxc(N)=max(error_c);

    if N==2
        fprintf("For Part A\n");
        fprintf('t \t Exact \t Approx_sol \t Error(abs)\n');
        for j=1:5
            fprintf('%d \t %.4f \t %.4f \t %.4f\n',j,y_exact_a_values(j),ya(j),error_a(j));
        end
        fprintf("\n");
        fprintf("For Part B\n");
        fprintf('t \t Exact \t Approx_sol \t Error(abs)\n');
        for j=1:5
            fprintf('%d \t %.4f \t %.4f \t %.4f\n',j,y_exact_b_values(j),yb(j),error_b(j));
        end
        fprintf("\n");
        fprintf("For Part C\n");
        fprintf('t \t Exact \t Approx_sol \t Error(abs)\n');
        for j=1:5
            fprintf('%d \t %.4f \t %.4f \t %.4f\n',j,y_exact_c_values(j),yc(j),error_c(j));
        end
        figure;
        plot(ta, ya, 'bo-', 'LineWidth', 2, 'DisplayName', 'Approximation');
        hold on;
        plot(ta, y_exact_a_values, 'ro-', 'LineWidth', 2, 'DisplayName', 'Exact Solution');
        xlabel('t');
        ylabel('Solution');
        title('x vs Solution for a part');
        grid on;
        legend('Location', 'best');
        
        figure;
        plot(tb, yb, 'bo-', 'LineWidth', 2, 'DisplayName', 'Approximation');
        hold on;
        plot(tb, y_exact_b_values, 'ro-', 'LineWidth', 2, 'DisplayName', 'Exact Solution');
        xlabel('t');
        ylabel('Solution');
        title('x vs Solution for b part');
        grid on;
        legend('Location', 'best');
        
        
        figure;
        plot(tc, yc, 'bo-', 'LineWidth', 2, 'DisplayName', 'Approximation');
        hold on;
        plot(tc, y_exact_c_values, 'ro-', 'LineWidth', 2, 'DisplayName', 'Exact Solution');
        xlabel('t');
        ylabel('Solution');
        title('x vs Solution for c part');
        grid on;
        legend('Location', 'best');
        
        
        
        % Plot absolute error for function a
        figure;
        plot(ta, error_a, 'r', 'LineWidth', 2);
        xlabel('t');
        ylabel('Absolute Error');
        title('Absolute Error of Approximations for Function a');
        grid on;
        
        % Plot absolute error for function b
        figure;
        plot(tb, error_b, 'g', 'LineWidth', 2);
        xlabel('t');
        ylabel('Absolute Error');
        title('Absolute Error of Approximations for Function b');
        grid on;
        
        % Plot absolute error for function c
        figure;
        plot(tc, error_c, 'b', 'LineWidth', 2);
        xlabel('t');
        ylabel('Absolute Error');
        title('Absolute Error of Approximations for Function c');
        grid on;

        
    end





end



N = [2, 4, 8, 16, 32, 64, 128,256];

% Calculate the ratio between successive elements in ordera, orderb, and orderc
ratio_a = ordera(2:end) ./ ordera(1:end-1);
ratio_b = orderb(2:end) ./ orderb(1:end-1);
ratio_c = orderc(2:end) ./ orderc(1:end-1);


% Take the logarithm base 2 of the ratios
log2_ratio_a = -(log2(ratio_a));
log2_ratio_b = -(log2(ratio_b));
log2_ratio_c = -(log2(ratio_c));

% Convert symbolic expressions to function handles


fprintf("For Part A\n");
fprintf('N \t E(N) \t Order\n');
for j=1:8
    fprintf('%d \t %.4f \t %.4f\n',2^j,ordera(j),log2_ratio_a(j));
end
fprintf("\n");
fprintf("For Part B\n");
fprintf('N \t E(N) \t Order\n');
for j=1:8
    fprintf('%d \t %.4f \t %.4f\n',2^j,orderb(j),log2_ratio_b(j));
end
fprintf("\n");
fprintf("For Part C\n");
fprintf('N \t E(N) \t Order\n');
for j=1:8
    fprintf('%d \t %.4f \t %.4f\n',2^j,orderc(j),log2_ratio_c(j));
end


% Plot


figure;
plot(N, log2_ratio_a, 'ro-', 'LineWidth', 2, 'DisplayName', 'Order A');
xlabel('N');
ylabel('Order');
title('N vs Order for part a');

figure;
plot(N, log2_ratio_b, 'go-', 'LineWidth', 2, 'DisplayName', 'Order B');
xlabel('N');
ylabel('Order');
title('N vs Order for part b');
figure;
plot(N, log2_ratio_c, 'bo-', 'LineWidth', 2, 'DisplayName', 'Order C');
xlabel('N');
ylabel('Order');
title('N vs Order for part c');


figure;
plot(log(N(1:8)), log(abs(ordermaxa(1:8))), 'bo-');
xlabel('N');
ylabel('Abs Error');
title('loglog plot of N vs Abs Error for parta');



% Plot for ordermaxb
figure;
plot(log(N(1:8)), log((ordermaxb(1:8))), 'bo-');
xlabel('N');
ylabel('Abs Error');
title('loglog plot of N vs Abs Error for partb');


% Plot for ordermaxc
figure;
plot(log(N(1:8)), log(abs(ordermaxc(1:8))), 'bo-');
xlabel('N');
ylabel('Abs Error');
title('loglog plot of N vs Abs Error for partc');

