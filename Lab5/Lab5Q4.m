years = [1950, 1960, 1970, 1980, 1990, 2000];
populations = [151326, 179323, 203302, 226542, 249633, 281422];
x1=1940;
x2=1975;
x3=2020;

n = length(years);

% Display the results
[y, ~]=Divided_difference(x1,years,populations);
fprintf('\nApproximate population in 1940: %d thousands\n', y);
[y, ~]=Divided_difference(x2,years,populations);
fprintf('Approximate population in 1975: %d thousands\n', y);
[y, divided_diff_table]=Divided_difference(x3,years,populations);
fprintf('Approximate population in 2020: %d thousands\n', y);

fprintf('Divided Difference Table:\n');
for i = 1:n
    for j = 1:i
        fprintf('%.9f\t', divided_diff_table(i, j));
    end
    fprintf('\n');
end

z= linspace(1940,2025,3000);
func=zeros(3000);
for i = 1:3000
    [func(i),table]=Divided_difference(z(i),years,populations);
end
% Plot for interpolated function
figure;
plot(z,func, 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('X vs Interpolated Function');
grid on;


