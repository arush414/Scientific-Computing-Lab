t = [1.00 1.01 1.02 1.03 1.04];
I = [3.10 3.12 3.14 3.18 3.24];

E = zeros(1,3);
n = length(t);
L = 0.98;
R = 0.142;

for i = 1:n-1
    E(1,i) = L*(I(1,i+1) - I(1,i))/(t(1,i+1) - t(1,i)) + R*I(1,i);
    fprintf('Approx Voltage at x = %.2f is : %.8f\n', t(1,i), E(1,i));
end

E(1,n) = L*(I(1,n-1)-I(1,n))/(t(1,n-1)-t(1,n)) + R*I(1,n);
fprintf('Approx Voltage at x = %.2f is : %.8f\n', t(1,n), E(1,n));