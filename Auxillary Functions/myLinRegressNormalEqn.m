function x = myLinRegressNormalEqn(A,b)

normalA = myMatrixMatrixMult(transpose(A),A);
normalb = myMatrixMult(transpose(A),b);

x = myLinearSolveChol(normalA,normalb);

end