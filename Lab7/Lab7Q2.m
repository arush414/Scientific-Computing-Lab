syms y;
x = [0,0,3,3,5,5,8,8,13,13];
f = [0,0,225,225,383,383,623, 623,993, 993];
df=[75,75,77,77,80, 80 ,74,74 ,72,72];
inp=10;
n = length(x);


fprintf('Part-(a)\n');

% Display the results
[H(y), divided_diff_table]=hermite_interpolation(x,f,df);
H_dash(y) = diff(H,y);

fprintf('\n\nApproximate position  of car at time = 10 seconds  using hermite interpolation comes out to be : %.8f feets\n', double(subs(H,y,inp)));
fprintf('\n\nApproximate speed  of car at time = 10 seconds  using hermite interpolation comes out to be : %.8f feets/second\n', double(subs(H_dash,y,inp)));
 fprintf('_____________________________________________________________________________________________________\n\n');
z= linspace(0,13,2000);
func=zeros(2000);
for i = 1:2000
    func(i)=double(subs(H,y,z(i)));
end
% Plot for interpolated function
figure;
plot(z,func, 'LineWidth', 2);
xlabel('Time');
ylabel('Distance');
title('Time vs Interpolated Function');
grid on;

for i = 1:2000
    func(i)=double(subs(H_dash,y,z(i)));
end
% Plot for interpolated function
figure;
plot(z,func, 'LineWidth', 2);
xlabel('Time');
ylabel('Speed');
title('Time vs Interpolated Function');
grid on;


% in feet/seconds
given_speed = double(290400/3600);

t_intervals= linspace(5,8,5000);
check=0;

fprintf('Part-(b)\n\n');

for i =1:5000
    if(double(subs(H_dash,y,t_intervals(i)))>=given_speed)
        fprintf("Car exceeds given speed at time = %.5f seconds with speed = %.6f feets/seconds\n",t_intervals(i),double(subs(H_dash,y,t_intervals(i))));
        fprintf('_____________________________________________________________________________________________________\n\n');
        check=1;
        break;
    end
end

if(check==0)
    fprintf("Car couldn't exceed given speed limit in the time interval 0 sec to 13 sec \n");
    fprintf('_____________________________________________________________________________________________________\n\n');
end


t_intervals= linspace(5,20,14000);
maxi=0;
time=0;
for i =1:8000
    if(double(subs(H_dash,y,t_intervals(i)))>=maxi)
        maxi=double(subs(H_dash,y,t_intervals(i)));
        time=t_intervals(i);
    end
end

fprintf('Part-(c)\n\n');

fprintf("Max Speed of the car comes out to be %.6f feets/seconds and it was achieved at time %.5f seconds \n",time,maxi);









