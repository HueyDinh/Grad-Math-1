function J = myJacobian(F_expr, sym_vector)
sym_N = length(sym_vector);

J = sym(zeros(sym_N,sym_N));

for f_index = 1:sym_N
    for sym_index = 1:sym_N
        J(f_index, sym_index) = simplify(diff(F_expr(f_index), sym_vector(sym_index)));
    end
end

end