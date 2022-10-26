function A = myCholesky(A)
% My implementation of Cholesky factorization
% Algorithm from Lecture Slide and Textbook
n = size(A,1);

for j = 1:n
    for k = 1:(j-1)
        for i = j:n
            A(i,j) = A(i,j) - A(i,k)*A(j,k);
        end
        A(k,j) = 0; % Extra bit to wipe the upper diagonal entries
    end
    A(j,j) = A(j,j)^0.5;

    for k = (j+1):n
        A(k,j) = A(k,j)/A(j,j);
    end
end

end