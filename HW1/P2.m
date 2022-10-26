clc; clear; close all
format shortEng
%% Result Verification

%%%% 2a
U = [
    3,6,6;
    0,4,9;
    0,0,8;
    ];
 b = [0 5 2]';

 x2a = myBackSubstitution(U,b)
 MATLABx2a = linsolve(U,b)

%%%% 2b
L = [
    5,0,0;
    5,4,0;
    6,4,8;
    ];
 b = [3 2 4]';

 x2b = myForwardSubstitution(L,b)
 MATLABx2b = linsolve(L,b)
%%
%%%% 2a. Back Substitution
function x = myBackSubstitution(A_upper,b)
    n = length(b); % Calculate Working Dimension
    x = zeros(n,1); % Allocation for Result Vector
    for subStep = n:-1:1 % Reverse Indexing From n to 1
        % Residual = Dot product of sub-vector on the right of the diagonal
        % entry and the sub-vector of known x entries
        residual = myInnerProduct(A_upper(subStep,subStep+1:n),x(subStep+1:n));
        % x at the current row = b at the current row - residual, then
        % divided by diagonal entry
        x(subStep) = (b(subStep)-residual)/A_upper(subStep,subStep);
    end
end

%%%% 2b. Forward Substitution
function x = myForwardSubstitution(A_lower,b)
    n = length(b); % Calculate Working Dimension
    x = zeros(n,1); % Allocation for Result Vector
    for subStep = 1:n % Forward Indexing From 1 to n
        % Residual = Dot product of sub-vector on the left of the diagonal
        % entry and the sub-vector of known x entries
        residual = myInnerProduct(A_lower(subStep,1:subStep-1),x(1:subStep-1));
        % x at the current row = b at the current row - residual, then
        % divided by diagonal entry
        x(subStep) = (b(subStep)-residual)/A_lower(subStep,subStep);
    end
end

%%%% Auxilliary Routines: Dot Product Calculation
function inner_product = myInnerProduct(a,b)
    n = length(a);
    inner_product = 0;
    for index = 1:n
        inner_product = inner_product + a(index)*b(index);
    end
end
