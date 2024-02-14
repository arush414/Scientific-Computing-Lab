x = [0, 0.1, 0.3,0.6,1];
f=[-6,-5.89483,-5.65014,-5.17788,-4.28172];
val=0.2;
n = length(x);

y=lagrange_interpolation(f, x,val,3);
fprintf('Approximate value of f(0.2) using lagrange interpolation comes out to be : %.8f\n',y);

[y, ~]=Divided_difference(val,x,f);
fprintf('Approximate value of f(0.2) using Newton’s divided difference comes out to be : %.8f\n\n',y);


fprintf("After Adding point x=1.1\n");

x = [0, 0.1, 0.3,0.6,1,1.1];
f=[-6,-5.89483,-5.65014,-5.17788,-4.28172,-3.99583];

y=lagrange_interpolation(f, x,val,3);
fprintf('Approximate value of f(0.2) using lagrange interpolation comes out to be : %.8f\n',y);

[y, ~]=Divided_difference(val,x,f);
fprintf('Approximate value of f(0.2) using Newton’s divided difference comes out to be : %.8f\n',y);

