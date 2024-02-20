
syms x

Time = [0, 3, 5, 8, 13];
Distance = [0, 225, 383, 623, 993];

% part (a)
fprintf('Part-(a)\n\n');
[S,S_dash] = natural_cubic_spline(Time, Distance,0);

idx = findid(Time, 10);
fprintf('Approximate position of car by natural spline at t=10sec is :- %f\n', double(subs(S(idx),x,10)));
fprintf('Approximate speed of car by natural spline at t=10sec is :- %f\n\n', double(subs(S_dash(idx),x,10)));

fprintf('_____________________________________________________________________________________________________\n\n');

% part (b)
fprintf('Part-(b)\n\n');
[S,S_dash] = clamped_cubic_spline(Time, Distance, 75, 72,0);

fprintf('Approximate position of car by clamped spline at t=10sec is :- %f\n', double(subs(S(idx),x,10)));
fprintf('Approximate speed of car by clamped spline at t=10sec is :- %f\n\n', double(subs(S_dash(idx),x,10)));
