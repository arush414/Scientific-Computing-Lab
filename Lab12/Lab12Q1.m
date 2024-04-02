f1 = @(t,y) 1+ (y./t) + (y./t).*(y./t);
f2= @(t,y) -t.*y + 4.*(t./y);
actual1 = @(t) t.*tan(log(t));
actual2= @(t) sqrt(4-3.*exp(-t.*t));
h1=0.2;
h2=0.1;
value1=0;
a1=1;
b1=3;
value2=1;
a2=0;
b2=1;
t_values_1 = a1:h1:b1;
t_values_2 = a2:h2:b2;
actual_values_1=actual1(t_values_1);
actual_values_2=actual2(t_values_2);
[y_values ,error_values ,max_error]=Adams_Bashfort(f1,actual1,value1,h1,b1,a1);
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
    [~,err,max_err]= Adams_Bashfort(f1,actual1,value1,h,b1,a1);
   
    order(N)=err(end);
    ordermax(N)=max_err;
end

plotting(actual_values_1,y_values,error_values,t_values_1,order,ordermax);

fprintf("\n\n");
[y_values ,error_values ,max_error]=Adams_Moulton(f1,actual1,value1,h1,b1,a1);
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
    [~,err,max_err]= Adams_Moulton(f1,actual1,value1,h,b1,a1);
   
    order(N)=err(end);
    ordermax(N)=max_err;
end

plotting(actual_values_1,y_values,error_values,t_values_1,order,ordermax);


fprintf("\n\n");

[y_values ,error_values ,max_error]=Adams_Bashfort(f2,actual2,value2,h2,b2,a2);
% Print table header
 disp('t        | Actual Value | Approximate Value | Absolute Error');
% Print values line by line
for i = 1:length(t_values_2)
    fprintf('%8.4f | %12.6f | %17.6f | %14.6f\n', t_values_2(i), actual_values_2(i), y_values(i), error_values(i));
end

order = zeros(1, 9);
ordermax = zeros(1, 9);

for N=1:9
    i= 2^(N+1);
    h=1/i;
    t=a2:h:b2;
    [~,err,max_err]= Adams_Bashfort(f2,actual2,value2,h,b2,a2);
   
    order(N)=err(end);
    ordermax(N)=max_err;
end

plotting(actual_values_2,y_values,error_values,t_values_2,order,ordermax);


fprintf("\n\n");
[y_values ,error_values ,max_error]=Adams_Moulton(f2,actual2,value2,h2,b2,a2);
% Print table header
 disp('t        | Actual Value | Approximate Value | Absolute Error');
% Print values line by line
for i = 1:length(t_values_2)
    fprintf('%8.4f | %12.6f | %17.6f | %14.6f\n', t_values_2(i), actual_values_2(i), y_values(i), error_values(i));
end

order = zeros(1, 9);
ordermax = zeros(1, 9);

for N=1:9
    i= 2^(N+1);
    h=1/i;
    t=a2:h:b2;
    [~,err,max_err]= Adams_Moulton(f2,actual2,value2,h,b2,a2);
   
    order(N)=err(end);
    ordermax(N)=max_err;
end

plotting(actual_values_2,y_values,error_values,t_values_2,order,ordermax);
