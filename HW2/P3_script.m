clc; clear; close all;
%% Step 1: Cholesky Decomposition

A = [4  -2  0;
    -2   4 -2;
     0  -2  4];

b = [4 3 9]';

L = myCholesky(A)

L_MATLAB = chol(A)' % Double checking

%% Step 2: Solve Ly=b -> Step 3: Solve Ux=y

% Terminal Output temporarily supressed inside myLinearSolveLU(A,b)

x = myLinearSolveChol(A,b);

%% Verify Decomposition

should_be_A = L*L'

%% Verify Linear Solve

matlab_x = A\b