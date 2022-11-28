function x = GaussSeidelLaplaceSpecialize(b,tol, true_sol)

MAX_ITER = 500;
true_sol_norm = norm(true_sol);

dim = length(b);
next_col_offset = int32(sqrt(dim));
x = zeros(dim,1);
iterCount = 0;

while true

    iterCount = iterCount + 1;

    for ele_index = 1:dim
        ele_index_mod = mod(ele_index-1,next_col_offset);

        i_minus_one_index = ele_index - next_col_offset;
        i_plus_one_index = ele_index + next_col_offset;
        j_minus_one_index = ele_index - 1;
        j_minus_one_mod = mod(j_minus_one_index-1,next_col_offset);
        j_plus_one_index = ele_index + 1;
        j_plus_one_mod = mod(j_plus_one_index-1,next_col_offset);

        if i_minus_one_index < 1
            add_i_minus_one = 0;
        else
            add_i_minus_one = x(i_minus_one_index);
        end

        if i_plus_one_index > dim
            add_i_plus_one = 0;
        else
            add_i_plus_one = x(i_plus_one_index);
        end

        if j_minus_one_mod > ele_index_mod
            add_j_minus_one = 0;
        else
            add_j_minus_one = x(j_minus_one_index);
        end

        if j_plus_one_mod < ele_index_mod
            add_j_plus_one = 0;
        else
            add_j_plus_one = x(j_plus_one_index);
        end

        x(ele_index) = (-b(ele_index) + add_i_plus_one + add_i_minus_one + add_j_plus_one + add_j_minus_one)/4;
    end
    
    err = norm(x - true_sol)/true_sol_norm;

    if err < tol
        return
    end

    if iterCount >= MAX_ITER
        error("Failure to converge, max iteration reached.");
    end

end

end