% Given data points
x = [0.0, 0.2, 0.4, 0.6, 0.8];
f = [1.00000, 1.22140, 1.49182, 1.82212, 2.22554];

% Step size
h = x(2) - x(1);

% Create the forward-difference table
n = length(f);
diff_table = zeros(n, n);
diff_table(:,1) = f'; % Column of f values

% Populate the backward-difference table
for j = 2:n
    for i = j:n
        diff_table(i,j) = diff_table(i,j-1) - diff_table(i-1,j-1);
    end
end

% Calculate the s-value
target_x = 0.65;
s = (target_x - x(n)) / h;

% Apply Newton's backward-difference formula
approx_value = f(n);
multiplier = 1;
for i = 1:n-1
    multiplier = multiplier * (s + (i-1)) / i;
    approx_value = approx_value + diff_table(n, i+1) * multiplier;
end

% Display the result
fprintf('The approximate value of f(0.65) is: %.8f\n', approx_value);

