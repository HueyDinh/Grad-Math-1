clc; clear; close all
format shortEng
%% 1a. Solving a Linear System
alpha = sqrt(2)/2;
A = zeros(13,13); % Initialized with full zeros

A(1,2) = 1; A(1,6) = -1; % Eqn. 1
A(2,3) = 1; % Eqn. 2
A(3,1) = alpha; A(3,4) = -1; A(3,5) = -alpha; % Eqn. 3
A(4,1) = alpha; A(4,3) = 1; A(4,5) = alpha; % Eqn. 4
A(5,4) = 1; A(5,8) = -1; % Eqn. 5
A(6,7) = 1; % Eqn. 6
A(7,5) = alpha; A(7,6) = 1; A(7,9) = -alpha; A(7,10) = -1; % Eqn. 7
A(8,5) = alpha; A(8,7) = 1; A(8,9) = alpha; % Eqn. 8
A(9,10) = 1; A(9,13) = -1; % Eqn. 9
A(10,11) = 1; % Eqn. 10
A(11,8) = 1; A(11,9) = alpha; A(11,12) = -alpha; % Eqn. 11
A(12,9) = alpha; A(12,11) = 1; A(12,12) = alpha; % Eqn. 12
A(13,12) = alpha; A(13,13) = 1; % Eqn. 13


b = [0, 10, 0, 0, 0, 0, 0, 15, 0, 20, 0, 0, 0]'; % Non-homogenous Vector

f = linsolve(A,b)

%% 1b. User Defined Suroutines

%%% Testing

%%%% i. Inner Product of b and f
myInnerProductResult = myInnerProduct(b,f)
MATLABInnerProduct = dot(b,f)

%%%% Multiplication of A and f
myMatrixMultResult = myMatrixMult(A,f)
MATLABMatrixMult = A*f

%%%% 2-Norm of f
my2NormResult = my2Norm(f)
MATLAB2NormResult = norm(f)

%%% Subroutine Definition

%%%% i. Inner Product of b and f
function inner_product = myInnerProduct(a,b) % No input sanitation here. This is not a Comp. Sci class
    n = length(a);
    inner_product = 0;
    for index = 1:n
        inner_product = inner_product + a(index)*b(index);
    end
end

%%%% Multiplication of A and f
function mat_mult = myMatrixMult(A,b) % No input sanitation here. This is not a Comp. Sci class
    n = length(b);
    mat_mult = zeros(n,1);
    for index = 1:n
        mat_mult(index) = myInnerProduct(A(index,:),b);
    end
end

%%%% 2-Norm of f
function squared_norm = my2Norm(a) % No input sanitation here.
    squared_norm = sqrt(myInnerProduct(a,a));
end