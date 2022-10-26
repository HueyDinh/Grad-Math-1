function inner_product = myInnerProduct(a,b)
% myInnerProduct: Calculate the inner product between two 1D arrays
    n = length(a);
    inner_product = 0;
    for index = 1:n
        inner_product = inner_product + a(index)*b(index);
    end
end