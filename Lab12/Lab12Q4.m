f1 = @(t,y) y-(t.*t)+1;
actual1 = @(t) (t+1).^2 - 0.5.*exp(t);
h1=0.2;
value1=0.5;
a1=0;
b1=1;
t_values_1 = a1:h1:b1;
[y_values ,error_values ,max_error]=Predictor_Corrector(f1,actual1,value1,h1,b1,a1);
% Print table header
 disp('t        | Actual Value | Approximate Value | Absolute Error');
% Print values line by line
for i = 1:length(t_values_1)
    fprintf('%8.4f | %12.6f | %17.6f | %14.6f\n', t_values_1(i), actual_values_1(i), y_values(i), error_values(i));
end

order = zeros(1, 9);
ordermax = zeros(1, 9);

for N=1:9
    i= 2^(N+1);
    h=1/i;
    t=a1:h:b1;
    [~,err,max_err]= Predictor_Corrector(f1,actual1,value1,h,b1,a1);
   
    order(N)=err(end);
    ordermax(N)=max_err;
end

plotting(actual_values_1,y_values,error_values,t_values_1,order,ordermax);


