fprintf("\nPart A\n\n");
F=@(x) exp(3.*x).*sin(2.*x);
actual=integral(F, 0, pi/4);
for n= 2:5
    fprintf("\nFor N= %d\n",n);
    val=Gaussian_Lagrange(F,n,0,pi/4);
    fprintf("Estimate of Integral using Gaussian Lagrange Method is %.6f\n",val);
    fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));
    val=Gaussian_Lobatto(F,n,0,pi/4);
    fprintf("Estimate of Integral using Gaussian Lobatto Method is %.6f\n",val);
    fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));

end
fprintf("\nPart B\n\n");
F=@(x) (2.*x)./(x.*x -4);
actual=integral(F, 1, 1.6);
for n= 2:5
    fprintf("\nFor N= %d\n",n);
    val=Gaussian_Lagrange(F,n,1,1.6);
    fprintf("Estimate of Integral using Gaussian Lagrange Method is %.6f\n",val);
    fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));
    val=Gaussian_Lobatto(F,n,1,1.6);
    fprintf("Estimate of Integral using Gaussian Lobatto Method is %.6f\n",val);
    fprintf("Absolute Error comes out to be  %.6f\n",abs(val-actual));

end