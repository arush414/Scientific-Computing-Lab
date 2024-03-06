fprintf("A part\n")
funca = @(x) x^4;
Rectangle_rule(funca,0.5,1);

fprintf("B part\n")
funcb = @(x) 2/(x-4);
Rectangle_rule(funcb,0,0.5);


fprintf("C part\n")
funcc = @(x) (2*x)/(x^2 -4);
Rectangle_rule(funcc,1,1.6);


fprintf("D part\n")
funcd = @(x) exp(3*x)*sin(2*x);
Rectangle_rule(funcd,0,3.14/4);


fprintf("E part\n")
funce = @(x) (sin(x)-1)^2;
Rectangle_rule(funce,0.75,1.3);



