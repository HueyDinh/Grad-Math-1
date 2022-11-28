function minimum = myGradientDescent(guess, grad, hess, tol)

ALPHA_TOL = 1e-4;
MAX_ITER = 30;

d_phi = @(vector, a) -grad(vector-a*grad(vector))'*grad(vector);
dd_phi = @(vector, a) grad(vector)'*hess(vector - a*grad(vector))*grad(vector);

iter_count = 0;
a_k_guess_prev = 0;
minimum_k_minus_one = guess;

while true
    iter_count = iter_count + 1;

    while true
        a_k = a_k_guess_prev - d_phi(minimum_k_minus_one,a_k_guess_prev)/dd_phi(minimum_k_minus_one,a_k_guess_prev);
        if abs(a_k - a_k_guess_prev) < ALPHA_TOL
            break;
        end
        a_k_guess_prev = a_k;
    end

    minimum = minimum_k_minus_one - a_k*grad(minimum_k_minus_one);
    err = my2Norm(minimum - minimum_k_minus_one);

    if err < tol
        return
    elseif iter_count >= MAX_ITER
        error("Convergence Failure!");
    end

    minimum_k_minus_one = minimum;
end
end

function squared_norm = my2Norm(a)
% my2Norm: dot a vector with itself and take the square root
    squared_norm = sqrt(myInnerProduct(a,a));
end

function inner_product = myInnerProduct(a,b)
% myInnerProduct: Calculate the inner product between two 1D arrays
    n = length(a);
    inner_product = 0;
    for index = 1:n
        inner_product = inner_product + a(index)*b(index);
    end
end