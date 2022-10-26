A = [
0.26 0.15;
0.29 0.31;
2.05 1.49;
];

b = [0.56 0.78 2.24]';

%% Step 1
a1 = A(:,1)
alpha1 = -my2Norm(a1)
v1 = a1 - alpha1*[1 0 0]'
num11 = myInnerProduct(v1,a1)
den11 = myInnerProduct(v1,v1)
H1a1 = a1 - 2*num11/den11*v1

col2 = A(:,2);
num12 = myInnerProduct(v1,col2)
den12 = den11;
H1col2 = col2 - 2*num12/den12*v1

num1b = myInnerProduct(v1,b)
den1b = den11;
H1b = b-2*num1b/den1b*v1

%% Step 2
a2 = [0; H1col2(2:end)]
alpha2 = -my2Norm(a2)
v2 = a2 - alpha2*[0 1 0]'
num2 = myInnerProduct(v2,H1col2)
den2 = myInnerProduct(v2,v2)
H2col2 = H1col2 - 2*num2/den2*v2

num2b = myInnerProduct(v2,H1b)
den2b = myInnerProduct(v2,v2)
H2H1b = H1b - 2*num2b/den2b*v2

%% Step 3
R = [[alpha1 0]', H2col2(1:2)]
b1 = H2H1b(1:2)

x2 = b1(2)/R(2,2)
x1 = (b1(1) - x2*R(1,2))/R(1,1)

%% Verification
A\b
