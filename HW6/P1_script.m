clc; clear; close all; format shortE
%%
alpha_tol = 1e-4; % tolerance for 1D optimization problem
square_norm_err_tol = 1e-6; % Sufficientyly small convergence step's square norm

% phi = objective fuction for 1D optimization problem
f = @(x) 4*x(1)^2 -4*x(1)*x(2) + 2*x(2)^2 + 8;
f_grad = @(x) [8*x(1) - 4*x(2), -4*x(1) + 4*x(2)]';
f_hess = @(x) [8 -4;-4 4]; % Not needed for manual implementation

d_phi = @(x, alpha) (-80 + 832*alpha)*x(1)^2 + (96 - 1024*alpha)*x(1)*x(2) + (-32 + 320*alpha)*x(2)^2;
dd_phi = @(x) 832*x(1)^2 - 1024*x(1)*x(2) + 320*x(2)^2;
alpha_k_plus_one = @(x, alpha) alpha - d_phi(x, alpha)/dd_phi(x);

prev_guess = [2 3]'; % initial guess
prev_alpha = 0;
iter = 0;
max_iter = 30;

% Iteration Table
iter_num = 1:max_iter;
x_k = zeros(length(iter_num),1);
y_k = zeros(length(iter_num),1);
a_k = zeros(length(iter_num),1);
x_k_plus_one = zeros(length(iter_num),1);
y_k_plus_one = zeros(length(iter_num),1);
err_data = zeros(length(iter_num),1);

while true
    iter = iter + 1;

    while true
        next_alpha = alpha_k_plus_one(prev_guess, prev_alpha);
        if abs(next_alpha - prev_alpha) < alpha_tol
            break;
        end
        prev_alpha = next_alpha;
    end

    next_guess = prev_guess - next_alpha*f_grad(prev_guess);
    err = my2Norm(next_guess - prev_guess);

    x_k(iter) = prev_guess(1);
    y_k(iter) = prev_guess(2);
    a_k(iter) = next_alpha;
    x_k_plus_one(iter) = next_guess(1);
    y_k_plus_one(iter) = next_guess(2);
    err_data(iter) = err;


    if err < square_norm_err_tol
        iter_table = table(iter_num(1:iter)', x_k(1:iter), y_k(1:iter), a_k(1:iter), x_k_plus_one(1:iter), y_k_plus_one(1:iter),err_data(1:iter), ...
            VariableNames = ["Iter.", "x_k","y_k","a_k", "x_k+1", "y_k+1","error"]);
        disp(iter_table);
        break;
    elseif iter >= max_iter
        error("Convergence Failure!");
    end
    prev_guess = next_guess;
end

fprintf("The numerical solution (x,y) to the local minimization algorithm is:");
next_guess
fprintf("The corresponding minimized value of the objective function f(x,y) is:");
f(next_guess)

figure;
plot(iter_table.x_k, iter_table.y_k, "-.*");
xlabel("x");
ylabel("y");
grid on; grid minor; axis padded; axis equal
title("Convergence Path: Gradient Descent");

figure;
semilogy(iter_table.(1), iter_table.error);
xlabel("Iteration Number");
ylabel("Approximate Error Between Iteration (2-Norm)");
title("Demonstration of Linear Convergence Rate: Gradient Descent");
grid on; grid minor;

%%
subroutine_result = myGradientDescent([2 3]',f_grad,f_hess,square_norm_err_tol)
