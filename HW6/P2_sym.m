clc; clear; close all;
%%
syms x y z real

f = -4*x + 5*sin(y) + 0.1*z - 5;
g = x^2 + 2*y + exp(-0.5*z) - 5;
h = x + y + z^2 - 12;
F = [f ; g; h];
sym_vector = [x y z]';
%%
J = myJacobian(F,sym_vector)
%%
MATLAB_jacobian = jacobian(F,sym_vector)
vpasolve(F, sym_vector, [0 0 0])