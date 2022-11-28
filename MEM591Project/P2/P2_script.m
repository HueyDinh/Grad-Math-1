clc; clear; close all;
%%
square_dim = int16(19);
C = TriDiagConstructor(-4, square_dim);
I = eye(square_dim);
super_sub_diag = TriDiagConstructor(0, square_dim);
A = kron(I,C) + kron(super_sub_diag, I);

figure;
contourf(A)
xlabel("Column Index")
ylabel("Row Index")
set(gca,"YDir","reverse")
title("Visualization of A Matrix's Block Tridiagonal Pattern");

one_in_pos1 = zeros(square_dim,1);
one_in_pos1(1) = 1;
all_ones = ones(square_dim,1);

b = -kron(one_in_pos1,all_ones) - kron(all_ones, one_in_pos1);

%%
temp_profile_flat = GaussElimination_NP(A,b);
MATLAB_result = mldivide(A,b);
difference = temp_profile_flat(abs(temp_profile_flat - MATLAB_result) > 1e-12)

%%
temp_profile_2D = zeros(square_dim + 2);
for flat_index = 0:(square_dim^2-1)
    i = idivide(flat_index, square_dim) + 1 + 1; % The additional offset of 1 accounts for the array location shift due to BC
    j = mod(flat_index, square_dim) + 1 + 1;
    temp_profile_2D(i,j) = temp_profile_flat(flat_index+1);
end

temp_profile_2D(:,1) = 1;
temp_profile_2D(1,:) = 1;
temp_profile_2D(square_dim + 2, 1) = 0.5;
temp_profile_2D(1, square_dim + 2) = 0.5;

x_1D = linspace(0,1,square_dim+2);
y_1D = linspace(0,1,square_dim+2);

[x_2D, y_2D] = meshgrid(x_1D, y_1D);

figure;
contourf(x_2D, y_2D, temp_profile_2D,9,"ShowText","on");
xlabel("x Coordinate");
ylabel("y Coordinate");
title("Temperature Profile Visualization Using Filled Contour Lines");
axis equal