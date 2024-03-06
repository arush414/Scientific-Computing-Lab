func=[124,134, 148, 156 ,147 ,133, 121, 109, 99, 85, 78, 89, 104, 116, 123];
X=[0,6,12,18,24,30,36,42,48,54,60,66,72,78,84];

n = length(func);
h = 6;
approx_value = func(1) + func(n);
for i = 2:n-1
    approx_value = approx_value + 2 * func(i);
end
approx_value = approx_value * (h/2);

fprintf("Approximate estimate using composite Trapezoidal rule comes out to be %.5f\n",approx_value);