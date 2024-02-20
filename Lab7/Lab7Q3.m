syms x

% part (a)
fun = @(x) exp(2*x);
fun_dash = @(x) 2*exp(2*x);

fprintf('Part-(a)\n\n');
fprintf('Exact value of f(0.43) is %f.\n', fun(0.43));
fprintf('Exact value of f''(0.43) is %f.\n\n', fun_dash(0.43));

X = [0, 0.5];
f = fun(X);

[S,S_dash] = natural_cubic_spline(X,f,0);

fprintf('Approximate value of f(0.43) by natural cubic spline is %f.\n', double(subs(S(findid(X,0.43)),x,0.43)));
fprintf('Approximate value of f''(0.43) by natural cubic spline is %f.\n\n', double(subs(S_dash(findid(X,0.43)),x,0.43)));

fprintf('Actual Error in f(0.43) for natural spline is %d.\n', abs(fun(0.43) - double(subs(S(findid(X,0.43)),x,0.43))));
fprintf('Actual Error in f''(0.43) for natural spline is %d.\n\n', abs(fun_dash(0.43) - double(subs(S_dash(findid(X,0.43)),x,0.43))));

lg = {'S(x)', 'f(x)'};
plot_spline(X,-1.5,1.5,S,fun,1,lg,'Plot for Que-3(a) - natural spline');

[S,S_dash] = clamped_cubic_spline(X,f,fun_dash(X(1)), fun_dash(X(end)),0);

fprintf('Approximate value of f(0.43) by clamped cubic spline is %f.\n', double(subs(S(findid(X,0.43)),x,0.43)));
fprintf('Approximate value of f''(0.43) by clamped cubic spline is %f.\n\n', double(subs(S_dash(findid(X,0.43)),x,0.43)));

fprintf('Actual Error in f(0.43) for clamped spline is %d.\n', abs(fun(0.43) - double(subs(S(findid(X,0.43)),x,0.43))));
fprintf('Actual Error in f''(0.43) for clamped spline is %d.\n\n', abs(fun_dash(0.43) - double(subs(S_dash(findid(X,0.43)),x,0.43))));

spline_plot(X,-1.5,1.5,S,fun,1,lg,'Plot for Que-3(a) - clamped spline');

fprintf('_____________________________________________________________________________________________________\n\n');

% part (b)
fprintf('Part-(b)\n\n');
fun = @(x) log(exp(x) + 2);
fun_dash = @(x) exp(x)/(exp(x)+2);
fprintf('Exact value of f(0.25) is %f.\n', fun(0.25));
fprintf('Exact value of f''(0.25) is %f.\n\n', fun_dash(0.25));

X = [0, 0.5];
f = fun(X);

[S,S_dash] = natural_cubic_spline(X,f,0);

fprintf('Approximate value of f(0.25) by natural cubic spline is %f.\n', double(subs(S(findid(X,0.25)),x,0.25)));
fprintf('Approximate value of f''(0.25) by natural cubic spline is %f.\n\n', double(subs(S_dash(findid(X,0.25)),x,0.25)));

fprintf('Actual Error in f(0.25) for natural spline is %d.\n', abs(fun(0.25) - double(subs(S(findid(X,0.25)),x,0.25))));
fprintf('Actual Error in f''(0.25) for natural spline is %d.\n\n', abs(fun_dash(0.25) - double(subs(S_dash(findid(X,0.25)),x,0.25))));
spline_plot(X,-2.5,2.5,S,fun,1,lg, 'Plot for Que-3(b) - natural spline');

[S,S_dash] = clamped_cubic_spline(X,f,fun_dash(X(1)), fun_dash(X(end)),0);

fprintf('Approximate value of f(0.25) by clamped cubic spline is %f.\n', double(subs(S(findid(X,0.25)),x,0.25)));
fprintf('Approximate value of f''(0.25) by clamped cubic spline is %f.\n\n', double(subs(S_dash(findid(X,0.25)),x,0.25)));

fprintf('Actual Error in f(0.25) for clamped spline is %d.\n', abs(fun(0.25) - double(subs(S(findid(X,0.25)),x,0.25))));
fprintf('Actual Error in f''(0.25) for clamped spline is %d.\n\n', abs(fun_dash(0.25) - double(subs(S_dash(findid(X,0.25)),x,0.25))));

spline_plot(X,-2.5,2.5,S,fun,1,lg,'Plot for Que-3(b) - clamped spline');

