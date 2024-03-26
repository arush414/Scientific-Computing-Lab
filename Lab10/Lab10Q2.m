syms x;
f(x) = sin(x);
Df1(x) = diff(f,x);

g(x) = log(x)*(x^2) + 1;
Df2(x) = diff(g,x);
Ddf2(x) = diff(Df2, x);

fprintf('Q2(a):\n');
fprintf('\nat x=0.5:');
fprintf('\nApproximate value at 0.5 is %f\n', (0.5646-0.4794)/(0.6-0.5));
fprintf('Actual value at 0.5 is %f\n', double(Df1(0.5)));
fprintf('Absolute value of error is %f\n', abs(double(Df1(0.5)) - (0.5646-0.4794)/(0.6-0.5)));
bound = 0;
for i=0.5:0.000001:0.6
    bound = max(bound,abs( ((0.6-0.5)*(-sin(i)))/2 ));
end
fprintf('Error bound is %f\n', bound);

fprintf('\nat x=0.6:');
fprintf('\nApproximate value at 0.6 is %f\n', (0.6442 - 0.5646)/(0.7-0.6)); 
fprintf('Actual value at 0.6 is %f\n', double(Df1(0.6)));
fprintf('Absolute value of error is %f\n', abs(double(Df1(0.6)) - (0.6442 - 0.5646)/(0.7-0.6)));
bound = 0;
for i=0.6:0.000001:0.7
    bound = max(bound,abs( ((0.7-0.6)*(-sin(i)))/2 ));
end
fprintf('Error bound is %f\n', bound);


fprintf('\nQ2(b):\n');
fprintf('\nat x=1.0:');
fprintf('\nForward difference value at 1.0 is %f\n', (1.2625-1.0000)/(1.2-1.0));
fprintf('Actual value at 1.0 is %f\n', double(Df2(1.0)));
fprintf('Absolute value of error is %f\n', abs(double(Df2(1.0)) - (1.2625-1.0000)/(1.2-1.0)));
bound = 0;
for i=1.0:0.01:1.2
    bound = max(bound,abs( ((1.2-1.0)*(double(Ddf2(i))))/2 ));
end
fprintf('Error bound is %f\n', bound);

fprintf('\nat x=1.2:\n');
fprintf('Forward difference value at 1.2 is %f\n', (1.6595 - 1.2625)/(1.4-1.2)); 
fprintf('Actual value at 1.2 is %f\n', double(Df2(1.2)));
fprintf('Absolute value of error is %f\n', abs(double(Df2(1.2)) - (1.6595 - 1.2625)/(1.4-1.2)));
bound = 0;
for i=1.2:0.01:1.4
    bound = max(bound,abs( ((1.4-1.2)*(double(Ddf2(i))))/2 ));
end
fprintf('Error bound is %f\n', bound);
