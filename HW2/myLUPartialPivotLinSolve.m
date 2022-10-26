function x = myLUPartialPivotLinSolve(A,b)
% myLUDecomp: personal implementation of LU decomposition without pivoting
n = size(A,1);
L = eye(n); % Starting point for L matrix
P = 1:n; % Permutation Tracker Array
zero_tol = 1e-8; % Cannot use == to compare floating point number

for pivot_index = 1:n % Pivoting from column 1 to column n

    % Find the index with maximum pivot in this column, below the current
    % pivot row. LOCAL pivot index in the range of the rows searched
    [~, max_pivot_relative_index] = max(abs(A(pivot_index:end,pivot_index)));
    % Add the current pivot index and subtract 1 to get the global max pivot index
    max_pivot_absolute_index = max_pivot_relative_index + pivot_index - 1;

    % If the current pivot row isn't already the maximum pivot row:
    % Swap the rows in matrix A
    % Swap the entries of P the same way A is swapped (P keep tracks of
    % the index of each original row: P(3) = the index of the
    % original 3rd row after the swappings)
    % Swap the columns in maxtrix L (right multiplication = column
    % operations, inverse of row swap matrix = itself)
    if max_pivot_absolute_index ~= pivot_index

        A([pivot_index, max_pivot_absolute_index],:) = A([max_pivot_absolute_index,pivot_index],:);
        P([pivot_index, max_pivot_absolute_index]) = P([max_pivot_absolute_index,pivot_index]);
        L(:,[pivot_index, max_pivot_absolute_index]) = L(:,[max_pivot_absolute_index,pivot_index]);
    end
    
    pivot = A(pivot_index,pivot_index);

    % If the max pivot is zero -> zero sub column -> skip to next pivot
    % (problem has no unique solution)
    if abs(pivot) < zero_tol % checking floating point zero
        continue
    end
    
    for elim_row_index = (pivot_index+1):n % start eliminating rows below the current pivot

        multiplier = A(elim_row_index,pivot_index)/pivot; % calculating multiplier

        L(P(elim_row_index), pivot_index) = multiplier; % Interpreting the inverse elementary operation AS A COLUNM OPERATOR (RIGHT MULTIPLICATION)

        A(elim_row_index,pivot_index) = 0; %% Save 1 calculation, we already know that this should be zero
     
        for elim_col_index = (pivot_index+1):n % Subtract multiplier * times pivot row from the eliminated column
            A(elim_row_index,elim_col_index) = A(elim_row_index,elim_col_index) - A(pivot_index,elim_col_index)*multiplier;
        end

    end

end

L_debug = L % Debug print pseudo-diagonal L to compare wuth lu()
U_debug = A % Debug print U to compare wuth lu()

% To get L as a lower diagonal matrix, apply the overall row swap to the
% current L. Row swap order encoded in P array
% To get the b that would not change the problem, also apply the 
b = b(P);
L = L(P,:) % DEBUG OUTPUT: PL = True lower diagonal

% With L being true Lower Diagonal, the Forward Substitution algorithm
% written in HW 1 can be used
y = myForwardSubstitution(L,b);
x = myBackSubstitution(A,y);

end