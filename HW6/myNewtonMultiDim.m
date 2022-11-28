function [guess, error_log, traj] = myNewtonMultiDim(guess, f , jac, tol)

    MAX_ITER = 50;
    dim = length(guess);
    iter_count = 0;
    prev_guess = guess;

    error_log_temp = zeros(1,MAX_ITER);
    traj_temp = zeros(dim,MAX_ITER);

    while true
        iter_count = iter_count + 1;

        currentJ = jac(prev_guess);
        currentf = f(prev_guess);
        update_vector = GaussElimination_PP(currentJ, -currentf);
        guess = prev_guess + update_vector;
        norm = my2Norm(f(guess));

        error_log_temp(iter_count) = norm;
        traj_temp(:,iter_count) = guess;

        if norm < tol
            error_log = error_log_temp(1:iter_count);
            traj = traj_temp(:,1:iter_count);
            return
        elseif iter_count >= MAX_ITER
            error_log = error_log_temp(1:iter_count);
            traj = traj_temp(:,1:iter_count);
            warning("Failure to Converge After Maximum Iteration")
            return;
        end
        prev_guess = guess;
    end

end

function x = GaussElimination_PP(A,b)

% Gaussian Elimination with Partial Pivoting
n = size(A,1);
zero_tol = 1e-8; % Cannot use == to compare floating point number

for pivot_index = 1:n % Pivoting from column 1 to column n

    [max_pivot_abs, max_pivot_relative_index] = myAbsMax(A(pivot_index:end,pivot_index));
    max_pivot_absolute_index = max_pivot_relative_index + pivot_index - 1;

    if max_pivot_abs < zero_tol
        continue
    end

    if max_pivot_absolute_index ~= pivot_index
        A([pivot_index, max_pivot_absolute_index],:) = A([max_pivot_absolute_index,pivot_index],:);
        b([pivot_index, max_pivot_absolute_index]) = b([max_pivot_absolute_index,pivot_index]);
    end
    
    pivot = A(pivot_index,pivot_index);
    
    for elim_row_index = (pivot_index+1):n % start eliminating rows below the current pivot

        multiplier = A(elim_row_index,pivot_index)/pivot; % calculating multiplier

        A(elim_row_index,pivot_index) = 0; %% Save 1 calculation, we already know that this should be zero
     
        for elim_col_index = (pivot_index+1):n
            A(elim_row_index,elim_col_index) = A(elim_row_index,elim_col_index) - A(pivot_index,elim_col_index)*multiplier;
        end

        b(elim_row_index) = b(elim_row_index) - b(pivot_index)*multiplier;

    end

end

% disp("DEBUG: Partial Pivoting U =")
% A

x = myBackSubstitution(A,b);

end

function x = myBackSubstitution(A_upper,b)
% myBackSubstitution: personal implementation of back-substitution

    n = length(b); % Calculate Working Dimension
    x = zeros(n,1); % Allocation for Result Vector
    for subStep = n:-1:1 % Reverse Indexing From n to 1
        % Residual = Dot product of sub-vector on the right of the diagonal
        % entry and the sub-vector of known x entries
        residual = myInnerProduct(A_upper(subStep,subStep+1:n),x(subStep+1:n));
        % x at the current row = b at the current row - residual, then
        % divided by diagonal entry
        x(subStep) = (b(subStep)-residual)/A_upper(subStep,subStep);
    end
end

function [maxVal, maxIndex] = myAbsMax(number_array)
% Given a 1D array, find the number with the maximum magnitude and its
% index inside the array
maxVal = -1;
maxIndex = -1;
for numberIndex = 1:length(number_array)
    current = abs(number_array(numberIndex));
    if current > maxVal
        maxVal = current;
        maxIndex = numberIndex;
    end
end
end

function squared_norm = my2Norm(a)
% my2Norm: dot a vector with itself and take the square root
    squared_norm = sqrt(myInnerProduct(a,a));
end

function inner_product = myInnerProduct(a,b)
% myInnerProduct: Calculate the inner product between two 1D arrays
    n = length(a);
    inner_product = 0;
    for index = 1:n
        inner_product = inner_product + a(index)*b(index);
    end
end