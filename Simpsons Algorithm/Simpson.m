function [I] = Simpson(x,y)
%Written by Flynn Yoder
%MECH 105
%4/19/2019

if nargin<2                              %Input errors
    fprintf('ERROR: both input vectors x and y are required\n')
elseif nargin>2
    fprintf('ERROR: Only input vectors x and y are necessary\n')
end

if length(x)~=length(y)                  %Checking if the x and y vectors match in length
    fprintf('ERROR: vectors x and y must be equal in length\n')
end

D=diff(x);                               %Checking if the x values are equally spaced
z=1;
while z<length(x)-1;
    if D(z)==D(z+1)
        z=z+1;
    elseif D(z)~=D(z+1)
        fprintf('ERROR: x values must be evenly spaced\n')
        return
    end
end

I=0;                                     %Calculating the area of the first points using the 1/3 rule
h=x(2)-x(1);
n=3;
while n<=length(x)
   A=(h/3)*(y(n-2)+4*y(n-1)+y(n));
   I=I+A;
   n=n+2;
end

if mod(length(x),2)==0                   %Checking if the x values are odd or even to determine if the trapezoidal rule is necessary
    A=(y(length(x))+y(length(x)-1))*h/2; %Trapezoidal rule, if necessary
    I=I+A;
    disp('The trapezoidal rule has been used in this calculation')
end
                                         %Displaying the calculated value
fprintf('The approximate area is %f',I)
end
 
