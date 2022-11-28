clc; clear; close all;

f = @(x) x.^4 - 1.4*x.^3 + 0.67*x.^2 - 0.126*x + 0.0072;
df = @(x) 4*x.^3 - 1.4*3*x.^2 + 0.67*2*x - 0.126;

x_plot_series = linspace(-0.1,0.7,1000);
f_plot_series = f(x_plot_series);

figure;
plot(x_plot_series, f_plot_series);
xlabel("x"); ylabel("f(x)");
title("Root Visualization");
grid on; grid minor;

rel_tol = 1e-10;

guess1= 0.0;
guess2= 0.2;
guess3= 0.5;
guess4= 0.7;
%%
root1 = myNewtonRoot(f,df,guess1,rel_tol)
%%
root2 = myNewtonRoot(f,df,guess2,rel_tol)
%%
root3 = myNewtonRoot(f,df,guess3,rel_tol)
%%
root4 = myNewtonRoot(f,df,guess4,rel_tol)

%%
guess1_0 = 0.0;
guess1_1 = 0.01;
guess2_0 = 0.2;
guess2_1 = 0.21;
guess3_0 = 0.5;
guess3_1 = 0.49;
guess4_0 = 0.7;
guess4_1 = 0.69;
%%
root1_sec = mySecantRoot(f,guess1_0, guess1_1, rel_tol)
%%
root2_sec = mySecantRoot(f,guess2_0, guess2_1, rel_tol)
%%
root3_sec = mySecantRoot(f,guess3_0, guess3_1, rel_tol)
%%
root4_sec = mySecantRoot(f,guess1_0, guess4_1, rel_tol)

%%
syms x;
f = x^4 - 1.4*x^3 + 0.67*x^2 - 0.126*x + 0.0072;

MATLAB_symbolic_solver = solve(f, x)

