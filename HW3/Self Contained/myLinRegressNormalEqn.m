function x = myLinRegressNormalEqn(A,b)

normalA = myMatrixMatrixMult(transpose(A),A); % General Matrix Multiplication
normalb = myMatrixMult(transpose(A),b); % Matrix Vector Multiplication

x = myLinearSolveChol(normalA,normalb);

end