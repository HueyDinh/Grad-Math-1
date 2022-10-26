clc; clear; close all
%%
A = [3 4 -2;
     8 5 -4;
     -6 -2 3];
b =[3 6 8]';
%%
my_x = myLUPartialPivotLinSolve(A,b)
%%
matlab_x = A\b
%%
[matlab_L, matlab_U] = lu(A)  
