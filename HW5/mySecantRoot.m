function next_guess = mySecantRoot(func, x0, x1, rel_tol)

MAX_ITER = 30;
ZERO_TOL = 1e-8;

iter_index = (1:MAX_ITER)';
guess_0_list = zeros(MAX_ITER,1);
guess_1_list = zeros(MAX_ITER,1);
next_guess_list = zeros(MAX_ITER,1);
f_list = zeros(MAX_ITER, 1);
deri_list = zeros(MAX_ITER, 1);
e_approx_list = zeros(MAX_ITER, 1);
r_list = zeros(MAX_ITER, 1);


prev_guess_0 = x0;
prev_guess_1 = x1;

for iter = 1:30

    current_deri = (func(prev_guess_1) - func(prev_guess_0)) / (prev_guess_1 - prev_guess_0);

    if abs(current_deri) < ZERO_TOL
        error("ERROR: Iterating Near Flat Region. Solution Instability.")
    end

    current_f = func(prev_guess_1);

    next_guess = prev_guess_1 - current_f/current_deri;

    e = abs(next_guess - prev_guess_1);
    rel_e = e/abs(next_guess);

    % Logging
    guess_0_list(iter) = prev_guess_0;
    guess_1_list(iter) = prev_guess_1;
    next_guess_list(iter) = next_guess;
    f_list(iter) = current_f;
    deri_list(iter) = current_deri;
    e_approx_list(iter) = e;
    r_list(iter) = abs(next_guess/prev_guess_1);

    if rel_e <= rel_tol
        debug_table = table( ...
            iter_index(1:iter), ...
            guess_0_list(1:iter), ...
            guess_1_list(1:iter), ...
            f_list(1:iter), ...
            deri_list(1:iter), ...
            next_guess_list(1:iter),...
            e_approx_list(1:iter), ...
            r_list(1:iter), ...
            VariableNames = ["n", "x_n","x{n-1}","f(x)", "df/dx(x)", "x_{n+1}","h = |x_{n+1} - x_n|", "r = |x_{n+1}/x_n|"]);
        disp(debug_table);
        figure;
        semilogy(iter_index(1:iter),e_approx_list(1:iter),"--*")
        xlabel("Iteration Number");
        ylabel("Error");
        grid on, grid minor;

        return
    end

    prev_guess_0 = prev_guess_1;
    prev_guess_1 = next_guess;

end

error("ERROR: Failure to Converge After %d Iterations.", MAX_ITER);

end
