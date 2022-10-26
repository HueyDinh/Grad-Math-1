function [L,U] = myLUDeComp(A)
% myLUDecomp: personal implementation of LU decomposition without pivoting
n = size(A,1);
L = eye(n);

for pivot_index = 1:n % Pivoting from column 1 to column n
    
    pivot = A(pivot_index,pivot_index);
    
    for elim_row_index = (pivot_index+1):n % start eliminating rows below the current pivot

        multiplier = A(elim_row_index,pivot_index)/pivot; % calculating multiplier

        L(elim_row_index,pivot_index) = multiplier;
        % Due to the structure of the elementary elimination matrix,
        % L = M^-1 is constructed by putting the multiplier where the
        % anihilated entry would be (without the negative sign)

        A(elim_row_index,pivot_index) = 0; %% Save 1 calculation, we already know that this should be zero
     
        for elim_col_index = (pivot_index+1):n
            A(elim_row_index,elim_col_index) = A(elim_row_index,elim_col_index) - A(pivot_index,elim_col_index)*multiplier;
        end

    end

end

U = A;

end