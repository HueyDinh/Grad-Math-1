clc; clear; close all;
%%
syms alpha real
syms x(alpha) y(alpha)
syms x_k y_k real

f = 4*x^2 - 4*x*y + 2*y^2 + 8;
grad_f = subs(gradient(f,[x,y]),[x, y],[x_k, y_k]);
phi = subs(f,[x,y],[x_k,y_k]-alpha*grad_f');
%%
d_phi = simplify(expand(diff(phi,alpha)))
pretty(d_phi)
%%
dd_phi = simplify(diff(d_phi, alpha))
pretty(dd_phi)