clc; clear; close all;
%%
syms x y real
syms x_k y_k real

f = 4*x^2 - 4*x*y + 2*y^2 + 8;
fsurf(f)