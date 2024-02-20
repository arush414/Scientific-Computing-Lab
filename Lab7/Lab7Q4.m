
syms x

fun = @(x) log(exp(x) + 2);

X = [-1, -0.5, 0, 0.5];
f = [0.86199480, 0.95802009, 1.0986123, 1.2943767];
FPO = 0.15536240;
FPN = 0.45186276;

[S, S_dash] = clamped_cubic_spline(X,f,FPO,FPN,1);


lg = {'S1(x)', 'S2(x)', 'S3(x)', 'f(x)'};
spline_plot(X, -4,4,S,fun,1,lg,'Plot for Que-4');
