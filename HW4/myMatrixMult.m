function mat_mult = myMatrixMult(A,b)
% myMatrixMult: matrix multiplication implementation using column
% perspective
    numRow = size(A,1);
    numCol = size(A,2);
    if numCol ~= length(b)
        error("Dimensional Mismatch")
    end
    mat_mult = zeros(numRow,1);
    for index = 1:numRow
        mat_mult(index) = myInnerProduct(A(index,:),b);
    end
end