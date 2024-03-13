fprintf("\nPart A\n");
F=@(x) x.*x.*log(x);
actual=integral(F, 1, 1.5);
val=Gaussian_Lagrange(F,2,1,1.5);
fprintf("Estimate of Integral using Gaussian Lagrange Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));
val=Gaussian_Lobatto(F,2,1,1.5);
fprintf("Estimate of Integral using Gaussian Lobatto Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));



fprintf("\nPart B\n");
F=@(x) 2./(x.*x -4);
actual=integral(F, 0, 0.35);
val=Gaussian_Lagrange(F,2,0,0.35);
fprintf("Estimate of Integral using Gaussian Lagrange Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));
val=Gaussian_Lobatto(F,2,0,0.35);
fprintf("Estimate of Integral using Gaussian Lobatto Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));