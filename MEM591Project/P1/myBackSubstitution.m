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