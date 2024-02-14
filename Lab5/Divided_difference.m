function [y,divided_diff_table] = Divided_difference(inp,x,f)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=length(x);
divided_diff_table=zeros(n,n);
divided_diff_table(:,1)=f';

for i =2:n
    for j=1:n+1-i
        divided_diff_table(j,i)=(divided_diff_table(j+1,i-1)-divided_diff_table(j,i-1))/(x(j+i-1)-x(j));
    end
end

y=f(1);
mult=1;
for i=2:n
    mult=mult*(inp-x(i-1));
    y=y+mult*divided_diff_table(1,i);
 
end

end
