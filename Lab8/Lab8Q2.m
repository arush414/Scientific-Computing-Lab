fprintf("A part\n")
funca = @(x) x^4;
Midpoint_rule(funca,0.5,1);
Trapezoidal_rule(funca,0.5,1);
Simpson_rule(funca,0.5,1);

fprintf("B part\n")
funcb = @(x) 2/(x-4);
Midpoint_rule(funcb,0,0.5);
Trapezoidal_rule(funcb,0,0.5);
Simpson_rule(funcb,0,0.5);

fprintf("C part\n")
funcc = @(x) (2*x)/(x^2 -4);
Midpoint_rule(funcc,1,1.6);
Trapezoidal_rule(funcc,1,1.6);
Simpson_rule(funcc,1,1.6);

fprintf("D part\n")
funcd = @(x) exp(3*x)*sin(2*x);
Midpoint_rule(funcd,0,pi/4);
Trapezoidal_rule(funcd,0,pi/4);
Simpson_rule(funcd,0,pi/4);


fprintf("E part\n")
funce = @(x) (sin(x)-1)^2;
Midpoint_rule(funce,0.75,1.3);
Trapezoidal_rule(funce,0.75,1.3);
Simpson_rule(funce,0.75,1.3);




