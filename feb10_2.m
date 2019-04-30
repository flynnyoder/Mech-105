%Flynn Yoder
%Mech 105
%2/10/19

x=1;               %defining variables
while x~=0         %the while loop and if loop will only run when x is not equal to 0
    if x>0         %the if loop that changes the value of x to find the smallest value of x that matlab can store
        small=x;
        x=x/2;
    end
end
fprintf('the smallest positive number used by Matlab is %s\n',small)   %displaying the final value of x that satisfies the above condition