func = @(x) 4/(1+x^2);
actual_ans= pi;

approx_value=Rectangle_rule(func,0,1);
fprintf("Absolute errors for Rectangle Rule is %.5f\n\n",abs(pi-approx_value))
approx_value=Trapezoidal_rule(func,0,1);
fprintf("Absolute errors for Trapezoidal Rule is %.5f\n\n",abs(pi-approx_value))
approx_value=Simpson_rule(func,0,1);
fprintf("Absolute errors for Simpson's 1/3rd Rule is %.5f\n\n",abs(pi-approx_value))
approx_value=Simpson_rule_threeeight(func,0,1);
fprintf("Absolute errors for  Simpson's 3/8th Rule is %.5f\n\n",abs(pi-approx_value))