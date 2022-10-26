function x = myLinearSolveLU(A,b)
% Solving Linear System Using LU Decomposition
[L,U] = myLUDeComp(A);
y = myForwardSubstitution(L,b)
x = myBackSubstitution(U,y)
end