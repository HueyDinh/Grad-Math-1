A = [
eye(4);
1 -1 0 0;
1 0 -1 0;
1 0 0 -1;
0 1 -1 0;
0 1 0 -1;
0 0 1 -1
];
b = [1.95 2.74 -2.45 3.32 1.23 4.45 1.61 3.21 0.45 -2.75]';
%%
x = myLinRegressHouseholder(A,b)
%%
x_MATLAB = A\b

%%
measured = [1.95 2.74 -2.45 3.32]';
percent_discrepancy = (x-measured)./measured*100