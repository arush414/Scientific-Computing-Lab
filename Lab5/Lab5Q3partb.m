x = [0.6, 0.7, 0.8,1];
f=[-0.17694460, 0.01375227,0.22363362,0.65809197];
val=0.9;
n = length(x);

y=lagrange_interpolation(f, x,val,3);
fprintf('Approximate value of f(0.9) using lagrange interpolation comes out to be : %.8f\n',y);
z= linspace(0,2,1000);
func=zeros(1000);
for i = 1:1000
    func(i)=lagrange_interpolation(f, x,z(i),3);
end
% Plot for actual function and interpolated function
figure;
plot(z,func, 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('X vs Interpolated Function');
grid on;



