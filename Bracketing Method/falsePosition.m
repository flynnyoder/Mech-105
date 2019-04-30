%Flynn Yoder
%MECH 105
%3/3/19

function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%Setting the initial iteration
n=0;

%Setting the default values for es==the relative error and max iterations
if nargin<=3
    es=0.000001
    maxiter=200
end

%Evaluating the midpoint
for q=1:maxiter
    n=n+1;
    low=func(xl);
    high=func(xu);
    midpoint=(xl+xu)/2;
    present=func(midpoint);
    best=midpoint;
    
    %Changing the brackets based on the functions slope and value at the
    %midpoint
    if abs(present)>es
        if high-low>0
            if present>0
                worst=midpoint;
                xu=midpoint;
            else
                worst=midpoint;
                xl=midpoint;
            end
        else high-low<0
            if present>0
                worst=midpoint;
                xl=midpoint;
            else
                worst=midpoint;
                xu=midpoint;
            end
        end
        
        %Setting the past values to calculate the relative error
        past=func(midpoint);
        best=midpoint;
    else
        %Displaying the final values 
        root=midpoint
        fx=present
        iter=n
        ea=abs((best-worst)*100/best);
        fprintf('The approximate relative error is %f percent\n',ea)
        fprintf('The root is at x=%d',midpoint)
        
        %Terminating the loops since the root has been found
        break
    end
end
end
 
