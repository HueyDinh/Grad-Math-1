clc; clear; close all;
%% Without Pivoting

A = [5 6 3;
     4 7 8;
     8 4 9];

b = [12 16 28]';

x_no_pivot = GaussElimination_NP(A,b)

%% With Partial Pivoting

x_partial_pivot = GaussElimination_PP(A,b)

%% Partial Pivot Verification

[~,U] = lu(A)

%% Solution Verification
x_MATLAB = A\b
