fprintf("\nPart A\n\n");
F=@(x) exp(-x.*x);
actual=integral(F, 0, 1);
fprintf("\nFor N= %d\n",2);
val=Gaussian_Legendre(F,2,0,1);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.8f\n",val);
fprintf("Absolute Error comes out to be  %.8f\n",abs(val-actual));


fprintf("\nFor N= %d\n",4);
val=Gaussian_Legendre(F,4,0,1);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.8f\n",val);
fprintf("Absolute Error comes out to be  %.8f\n",abs(val-actual));


fprintf("\nFor N= %d\n",6);
val=Gaussian_Legendre(F,6,0,1);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.8f\n",val);
fprintf("Absolute Error comes out to be  %.8f\n",abs(val-actual));


fprintf("\nPart B\n\n");
F=@(x) 1./(1+x.*x);
actual=integral(F, -4, 4);
fprintf("\nFor N= %d\n",2);
val=Gaussian_Legendre(F,2,-4,4);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.8f\n",val);
fprintf("Absolute Error comes out to be  %.8f\n",abs(val-actual));

fprintf("\nFor N= %d\n",4);
val=Gaussian_Legendre(F,4,-4,4);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.8f\n",val);
fprintf("Absolute Error comes out to be  %.8f\n",abs(val-actual));

fprintf("\nFor N= %d\n",6);
val=Gaussian_Legendre(F,6,-4,4);
fprintf("Estimate of Integral using Gaussian Legendre Method is %.8f\n",val);
fprintf("Absolute Error comes out to be  %.8f\n",abs(val-actual));

