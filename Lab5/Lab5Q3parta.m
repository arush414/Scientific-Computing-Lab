x = [0, 0.25, 0.5,0.75];
f=[1,1.64872, 2.71828,4.48169];
val=0.43;
n = length(x);

y=lagrange_interpolation(f, x,val,3);
fprintf('Approximate value of f(0.43) using lagrange interpolation comes out to be : %.8f\n',y);
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


