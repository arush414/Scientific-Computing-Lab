fprintf("\nPart A\n\n");
F=@(x) exp(x).*sin(x);
actual=integral(F, -1, 1);
fprintf("\nFor N= %d\n",2);
val=Gaussian_Legendre(F,2,-1,1);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));
val=Gaussian_Lobatto(F,2,-1,1);
fprintf("Estimate of Integral using Gaussian Lobatto Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));



fprintf("\nFor N= %d\n",4);
val=Gaussian_Legendre(F,4,-1,1);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));
val=Gaussian_Lobatto(F,4,-1,1);
fprintf("Estimate of Integral using Gaussian Lobatto Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));


fprintf("\nPart B\n\n");
F=@(x) exp(x).*cos(x);
actual=integral(F, -1, 1);
fprintf("\nFor N= %d\n",2);
val=Gaussian_Legendre(F,2,-1,1);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));
val=Gaussian_Lobatto(F,2,-1,1);
fprintf("Estimate of Integral using Gaussian Lobatto Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));

fprintf("\nFor N= %d\n",4);
val=Gaussian_Legendre(F,4,-1,1);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));
val=Gaussian_Lobatto(F,4,-1,1);
fprintf("Estimate of Integral using Gaussian Lobatto Method is %.6f\n",val);
fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));


