function coeffs = myPolyFitNormalEqn(independent, dependent, deg)

num_row = length(independent);

if num_row ~= length(dependent)
    error("Array Size Mismatch")
end

poly_lambda = @(x, n) x^n;


A = zeros(length(independent),deg+1);

for col = 0:deg
    for row = 1:num_row
        A(row,col+1) = poly_lambda(independent(row),col);
    end
end

coeffs = myLinRegressNormalEqn(A,dependent);

end