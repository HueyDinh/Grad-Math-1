function x = myForwardSubstitution(A_lower,b)
% myForwardSubstitution: personal implementation of forward substitution

    n = length(b); % Calculate Working Dimension
    x = zeros(n,1); % Allocation for Result Vector
    for subStep = 1:n % Forward Indexing From 1 to n
        % Residual = Dot product of sub-vector on the left of the diagonal
        % entry and the sub-vector of known x entries
        residual = myInnerProduct(A_lower(subStep,1:subStep-1),x(1:subStep-1));
        % x at the current row = b at the current row - residual, then
        % divided by diagonal entry
        x(subStep) = (b(subStep)-residual)/A_lower(subStep,subStep);
    end
end
