function A_T = myTranspose(A)
[row, col] = size(A);
A_T = zeros(col, row);
for row_number = 1:row
    for col_number = 1:col
        A_T(col_number, row_number) = A(row_number,col_number);
    end
end

end