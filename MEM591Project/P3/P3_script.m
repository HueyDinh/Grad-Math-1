clc; clear; close all
%%
square_dim = int16(19);
C = TriDiagConstructor(-4, square_dim);
I = eye(square_dim);
super_sub_diag = TriDiagConstructor(0, square_dim);
A = kron(I,C) + kron(super_sub_diag, I);

one_in_pos1 = zeros(square_dim,1);
one_in_pos1(1) = 1;
all_ones = ones(square_dim,1);

b = -kron(one_in_pos1,all_ones) - kron(all_ones, one_in_pos1);

TOL = 0.01;

%%
ticGauss = tic;
xGAUSS = mldivide(A,b);
tocGauss = toc(ticGauss)

%%
ticJacobi = tic;
xJACOBI = JacobiLapaceSpecialize(b,TOL, xGAUSS);
tocJacobi = toc(ticJacobi)

%%
ticJacobiNaive = tic;
xJACOBINAIVE = JacobiGeneric(A, b,TOL, xGAUSS);
tocJacobiNaive = toc(ticJacobiNaive)

%%
ticSeidel = tic;
xSEIDEL = GaussSeidelLaplaceSpecialize(b,TOL,xGAUSS);
tocSeidel = toc(ticSeidel)

%%
ticSeidelNaive = tic;
xSEIDELNAIVE = GaussSeidelGeneric(A, b,TOL, xGAUSS);
tocSeidelNaive = toc(ticSeidelNaive)