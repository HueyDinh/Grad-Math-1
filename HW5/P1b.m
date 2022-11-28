clc; clear; close all;

x_start = 0.5;
x_end = 1.5;
tol = 1e-6;
func = @(x) x*sin(x) - 0.5;

root = myBisection(func,x_start, x_end, tol)

should_be_zero = func(root)