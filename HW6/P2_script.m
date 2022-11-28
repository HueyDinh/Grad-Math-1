clc; clear; close all;
%%
f = @(x) -4*x(1) + 5*sin(x(2)) + 0.1*x(3) - 5;
g = @(x) x(1)^2 + 2*x(2) + exp(-0.5*x(3)) - 5;
h = @(x) x(1) + x(2) + x(3)^2 - 12;
F = @(x) [f(x);g(x);h(x)];
J = @(x) [ -4, 5*cos(x(2)),         1/10;
          2*x(1),        2, -exp(-x(3)/2)/2;
            1,        1,          2*x(3)];

init = [0, 0, 0]';

[my_result, error_data, conv_trajectory] = myNewtonMultiDim(init,F,J, 0.001);
%%
my_result
%%
verification = F(my_result)
%%
figure;
semilogy(error_data);
xlabel("Iteration");
ylabel("||F||_2");
title("Convergence Rate of Newton Method");
grid on; grid minor
