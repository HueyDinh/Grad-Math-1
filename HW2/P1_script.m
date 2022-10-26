clc; clear; close all;
%% Step 1: LU Decomposition

A = [4   6 -2;
     4   9 -3;
    -3  -2  9];

b = [3 8 12]';

[L,U] = myLUDeComp(A)

[matlab_L, matlab_U] = lu(A) % Double checking

%% Step 2: Solve Ly=b -> Step 3: Solve Ux=y

% Terminal Output temporarily supressed inside myLinearSolveLU(A,b)

x = myLinearSolveLU(A,b);

%% Verify

matlab_x = A\b