function [approx_value,diff_table] = backward_interpolation(inp,x,f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n = length(f);

h = x(2) - x(1);

% Create the forward-difference table

diff_table = zeros(n, n);
diff_table(:,1) = f'; % Column of f values

% Populate the backward-difference table
for j = 2:n
    for i = j:n
        diff_table(i,j) = diff_table(i,j-1) - diff_table(i-1,j-1);
    end
end

% Calculate the s-value
target_x = inp;
s = (target_x - x(n)) / h;

% Apply Newton's backward-difference formula
approx_value = f(n);
multiplier = 1;
for i = 1:n-1
    multiplier = multiplier * (s + (i-1)) / i;
    approx_value = approx_value + diff_table(n, i+1) * multiplier;
end


end