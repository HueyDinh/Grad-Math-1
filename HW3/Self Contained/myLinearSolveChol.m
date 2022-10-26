function x = myLinearSolveChol(A,b)
% Solving Linear System Using Chol Decomposition
L = myCholesky(A);

L_T = myTranspose(L);

y = myForwardSubstitution(L,b);
x = myBackSubstitution(L_T,y);
end