syms y;
x = [-1,-1,-0.5,-0.5,0,0,0.5,0.5];
f = [0.86199480,0.86199480,0.95802009,0.95802009,1.0986123,1.0986123,1.2943767 ,1.2943767 ];
df=[0.15536240,0.15536240,0.23269654,0.23269654,0.33333333,0.33333333,0.45186776,0.45186776];
inp=0.25;
n = length(x);
g=@(x) log(exp(x)+2);
% Display the results
[H(y), divided_diff_table]=hermite_interpolation(x,f,df);


fprintf('Hermite interpolation Table:\n');
for i = 1:n

     fprintf('x%d:', i);
     for j = 1:n
            fprintf('\t%.8f', divided_diff_table(i, j));
     end
     fprintf('\n');
end

fprintf('\n\nApproximate value of f(0.25) using hermite interpolation comes out to be : %.8f\n', double(subs(H,y,0.25)));
fprintf('Absolute error at x=0.25 comes out to be : %.8f\n',abs(double(subs(H,y,0.25))-g(0.25)));



z= linspace(-1,1,1000);
func=zeros(1000);
for i = 1:1000
    func(i)=double(subs(H,y,z(i)));
end
% Plot for interpolated function
figure;
plot(z,func, 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('X vs Interpolated Function');
grid on;


