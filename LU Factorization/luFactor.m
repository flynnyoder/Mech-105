function [L,U,P] = luFactor(A)
%Flynn Yoder
%Mech 105
%3/30/19

%This function takes a 3x3 matrix [A] and decomposes it into [L] and [U] using
%LU decomposition.

P=eye(3,3);                   %creating an identity pivot matrix
L=[1 0 0;0 1 0;0 0 1];        %creating the basis for the L and U matrixes
U=[A(1,:);0 0 0;0 0 0];


if abs(A(1,1))<abs(A(2,1)) && abs(A(2,1))>abs(A(3,1))  %partial pivoting
    piv1=P(1,:);
    P(1,:)=P(2,:);
    P(2,:)=P(3,:);
    P(3,:)=piv1;
end
if abs(A(1,1))<abs(A(2,1)) && abs(A(2,1))<abs(A(3,1))  
    piv2=P(1,:);         
    P(1,:)=P(3,:);
    P(3,:)=piv2;
end
if abs(A(2,1))<abs(A(3,1)) && abs(A(3,1))<=abs(A(1,1))
    piv3=P(2,:);
    P(2,:)=P(3,:);
    P(3,:)=piv3;
end
Anew=[P]*[A];                         %creating a temporary A matrix

a1=Anew(2,1)/Anew(1,1);               %gauss elimination
Anew(2,:)=Anew(2,:)-(a1*(Anew(1,:)));
a2=Anew(3,1)/Anew(1,1);
Anew(3,:)=Anew(3,:)-(a2*(Anew(1,:)));
L(2,1)=a1;                            %inputting L values
L(3,1)=a2;

if abs(Anew(2,2))<abs(Anew(3,2))      %more partial pivoting
    piv4=P(2,:);                      %pivoting the pivot matrix
    P(2,:)=P(3,:);
    P(3,:)=piv4;
    temp1=Anew(2,:);                  %pivoting the temporary A matrix
    Anew(2,:)=Anew(3,:);
    Anew(3,:)=temp1;
    temp2=L(2,1);                     %pivoting L values
    L(2,1)=L(3,1);
    L(3,1)=temp2;
end

a3=Anew(3,2)/Anew(2,2);               %gauss elimination
Anew(3,:)=Anew(3,:)-(a3*(Anew(2,:)));

P
U=Anew                                %inputting L and U values
L(3,2)=a3;
L=[P]*[L]

end
 
