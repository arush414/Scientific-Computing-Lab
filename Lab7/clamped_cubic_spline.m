function [S,S_dash] = clamped_cubic_spline(X, f, FPO, FPN, disp)
    syms x

    n = length(X);
    h = [];
    l = zeros(1,n);
    mu = zeros(1,n);
    z = zeros(1,n);
    c = zeros(1,n);
    b = zeros(1,n-1);
    d = zeros(1,n-1);

    for i = 1:n-1
        h = [h, X(i+1) - X(i)];
    end
    alpha = [3*(f(2) - f(1))/h(1) - 3*FPO];
    for i = 2:n-1
        alpha = [alpha, 3*(f(i+1) - f(i))/h(i) - 3*(f(i) - f(i-1))/h(i-1)];
    end
    alpha = [alpha, 3*FPN - 3*(f(n) - f(n-1))/h(n-1)];

    l(1,1) = 2*h(1);
    mu(1,1) = 0.5;
    z(1,1) = alpha(1)/l(1,1);
    for i=2:n-1
        l(1,i) = 2*(X(i+1) - X(i-1)) - h(i-1)*mu(1,i-1);
        mu(1,i) = h(i)/l(1,i);
        z(1,i) = (alpha(i) - h(i-1)*z(1,i-1))/l(1,i);
    end
    l(1,n) = h(n-1)*(2-mu(n-1));
    z(1,n) = (alpha(n) - h(n-1)*z(n-1))/l(n);
    c(1,n) = z(1,n);
    for j = 1:n-1
        c(1,n-j) = z(1,n-j) - mu(1,n-j)*c(1,n-j+1);
        b(1,n-j) = (f(n-j+1) - f(n-j))/h(n-j) - h(n-j)*(c(1,n-j+1) + 2*c(1,n-j))/3;
        d(1,n-j) = (c(1,n-j+1) - c(1,n-j))/(3*h(n-j));
    end
    a = f(1:n-1);
    c = c(1,1:n-1);

    S = [];
    S_dash = [];
    for i = 1:length(a)
        S = [S, a(i) + b(i)*(x-X(i)) + c(i)*(x - X(i))^2 + d(i)*(x - X(i))^3];
        S_dash = [S_dash, b(i) + 2*c(i)*(x - X(i)) + 3*d(i)*(x-X(i))^2];
    end
    if disp == 1
        a
        b
        c
        d
    end
end