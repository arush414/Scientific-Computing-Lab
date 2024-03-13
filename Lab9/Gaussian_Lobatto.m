function [val] = Gaussian_Lobatto(F,n,a,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
f=@(t) F(((b-a)*t+(b+a))/2);
if n==2
    val=f(1)+f(-1);
elseif n==3
    val=(4/3)*f(0)+(1/3)*f(1)+(1/3)*f(-1);
elseif n==4
    w1=1/6;
    w2=5/6;
    x1=1;
    x2=1/sqrt(5);
    val=w1*f(x1)+w1*f(-x1)+w2*f(x2)+w2*f(-x2);

elseif n==5
    w1=32/45;
    w2=49/90;
    w3=1/10;
    x1=sqrt(21)/7;
    x2=1;
    val=w1*f(0)+w2*f(x1)+w2*f(-x1)+w3*f(x2)+w3*f(-x2);

elseif n==6
    w1=(14+sqrt(7))/30;
    w2=(14-sqrt(7))/30;
    w3=	1/15;
    x1=sqrt(7-2*sqrt(7))/sqrt(21);
    x2=sqrt(7+2*sqrt(7))/sqrt(21);
    x3=1;
    val=w1*f(x1)+w1*f(-x1)+w2*f(x2)+w2*f(-x2)+w3*f(x3)+w3*f(-x3);

end
val=val*(b-a)/2 ; 

end
