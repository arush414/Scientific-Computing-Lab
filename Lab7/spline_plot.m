function spline_plot(X,a,b,S,f,disp,lg,t)
    syms x

    n = length(X);
    figure;
    if n == 2
        fplot(S(1), [a,b], 'LineWidth',2);
        hold on;
    else
        fplot(S(1), [a,X(2)], 'LineWidth',2);
        hold on;
        if n > 3
            for i=2:n-2
                fplot(S(i), [X(i),X(i+1)], 'LineWidth',2);
            end
        end
        fplot(S(n-1), [X(n-1),b], 'LineWidth',2);
        hold on;
    end 
    if disp == 1
        fplot(f,[a,b],'LineWidth',2);
        legend(lg);
    end
    title(t);
    hold off;
end
