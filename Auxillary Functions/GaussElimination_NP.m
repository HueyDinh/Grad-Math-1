function x = GaussElimination_NP(A,b)
% Gaussian Elimination without Pivoting
n = size(A,1);
zero_tol = 1e-8; % Cannot use == to compare floating point number

for pivot_index = 1:n % Pivoting from column 1 to column n
    
    pivot = A(pivot_index,pivot_index);

    if abs(pivot) < zero_tol % checking floating point zero
        
        swap_available = false; % if no possible non-zero swap is found, go to next pivot

        for substitution_index = (pivot_index+1):n

            if  abs(A(substitution_index,pivot_index)) > zero_tol % finding the first possible non-zero pivot swap
                A([pivot_index,substitution_index],:) = A([substitution_index, pivot_index],:);
                pivot = A(pivot_index,pivot_index);
                b([pivot_index,substitution_index]) = b([substitution_index, pivot_index]);
                swap_available = true;
                break;
            end

        end

        if ~swap_available
            continue
        end

    end
    
    for elim_row_index = (pivot_index+1):n % start eliminating rows below the current pivot

        multiplier = A(elim_row_index,pivot_index)/pivot; % calculating multiplier

        A(elim_row_index,pivot_index) = 0; %% Save 1 calculation, we already know that this should be zero
     
        for elim_col_index = (pivot_index+1):n
            A(elim_row_index,elim_col_index) = A(elim_row_index,elim_col_index) - A(pivot_index,elim_col_index)*multiplier;
        end

        b(elim_row_index) = b(elim_row_index) - b(pivot_index)*multiplier;

    end

end

% disp("DEBUG: No Pivoting U =")
% A

x = myBackSubstitution(A,b);

end