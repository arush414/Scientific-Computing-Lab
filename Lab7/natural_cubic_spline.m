function [S,S_dash] = natural_cubic_spline(X, f, disp)
    syms x

    n = length(X);
    h = [];
    alpha = [];
    for i = 1:n-1
        h = [h, X(i+1) - X(i)];
    end
    for i = 2:n-1
        alpha = [alpha, 3*(f(i+1) - f(i))/h(i) - 3*(f(i) - f(i-1))/h(i-1)];
    end
    l = zeros(1,n);
    mu = zeros(1,n);
    z = zeros(1,n);
    l(1,1) = 1;

    for i=2:n-1
        l(1,i) = 2*(X(i+1) - X(i-1)) - h(i-1)*mu(1,i-1);
        mu(1,i) = h(i)/l(1,i);
        z(1,i) = (alpha(i-1) - h(i-1)*z(1,i-1))/l(1,i);
    end
    l(1,n) = 1;
    c = zeros(1,n);
    b = zeros(1,n-1);
    d = zeros(1,n-1);
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