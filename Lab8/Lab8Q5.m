func= @(x) x.*log(x);
actual_value= integral(func,1,2);

fprintf("A part Trapezoidal rule \n")

n = 2;
error= 100000;
while(true)
    approx_value=Composite_trapezoidal(func,1,2,5,n);
    error= abs(approx_value-actual_value);
    if(error<=1e-5)
        break;
    else
        n=n+1;
    
    end
end


fprintf("Value of n for which error comes out less than 1e-5 is %d  and h comes out to be %.5f\n",n-1,1/(n-1));
fprintf("Value of corresponding integral is %.5f\n\n",approx_value); 

fprintf("B part  Composite Simpsons rule \n")

n = 1;
error= 100000;
while(true)
    approx_value=Composite_simpsons(func,1,2,n);
    error= abs(approx_value-actual_value);
    if(error<=1e-5)
        break;
    else
        n=n+1;
    
    end
end


fprintf("Value of n for which error comes out less than 1e-5 is %d  and h comes out to be %.5f\n",n,1/(n));
fprintf("Value of corresponding integral is %.5f\n\n",approx_value); 

fprintf("C part  Composite Midpoint rule \n")

n = 1;
error= 100000;
while(true)
    approx_value=Composite_midpoint(func,1,2,n);
    error= abs(approx_value-actual_value);
    if(error<=1e-5)
        break;
    else
        n=n+1;
    
    end
end


fprintf("Value of n for which error comes out less than 1e-5 is %d  and h comes out to be %.5f\n",n,1/(n));  
fprintf("Value of corresponding integral is %.5f\n\n",approx_value); 
