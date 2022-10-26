clc; clear; close all;
%%
A = [
9 9 6 4 5;
5 8 6 5 9;
4 6 2 4 9;
6 4 12 3 7;
3 7 9 2 3
];

x0 = transpose([0 1 0 1 0]);

[eigVal,eigVector] = myPowerIterationNorm(A,x0,1e-6,20)