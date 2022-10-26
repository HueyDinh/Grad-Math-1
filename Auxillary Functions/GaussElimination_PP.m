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