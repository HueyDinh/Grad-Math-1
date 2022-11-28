function x = JacobiGeneric(A, b, tol, true_sol)

MAX_ITER = 500;
true_sol_norm = norm(true_sol);

dim = length(b);
x_prev = zeros(dim,1);
x = zeros(dim,1);
iterCount = 0;

while true

    iterCount = iterCount + 1;
    
    for i = 1:dim

        accumulator = 0;
        for j = 1:dim
            if i == j
                continue
            else
                accumulator = accumulator + A(i,j)*x_prev(j);
            end
        end
        x(i) = (b(i) - accumulator) / A(i,i);

    end
    
    err = norm(x - true_sol)/true_sol_norm;

    if err < tol
        return
    end

    if iterCount >= MAX_ITER
        error("Failure to converge, max iteration reached.");
    end
    x_prev = x;
end

end