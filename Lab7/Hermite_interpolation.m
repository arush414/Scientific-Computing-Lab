function [H, Q] = Hermite_interpolation(X, f, f_dash)
    syms x
    
    n = length(X);
    Q = zeros(2*n, 2*n);
    z = zeros(2*n);
    
    for i = 1:n
        z(2*i-1) = X(i);
        z(2*i) = X(i);
        Q(2*i-1, 1) = f(i);
        Q(2*i, 1) = f(i);
        Q(2*i, 2) = f_dash(i);
        
        if i ~= 1
            Q(2*i-1, 2) = (Q(2*i-1,1) - Q(2*i-2, 1))/(z(2*i-1) - z(2*i-2));
        end
    end
    
    for i = 3:2*n
        for j = 3:i
            Q(i,j) = (Q(i, j-1) - Q(i-1, j-1))/(z(i) - z(i-j+1));
        end
    end
    
    H(x) = Q(1,1) + x - x;
    multiplier = 1;
    for i = 2:2*n
        multiplier = multiplier * (x - z(i-1));
        H(x) = H(x) + Q(i,i)*multiplier;
    end
end