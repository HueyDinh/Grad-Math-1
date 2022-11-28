function b = BConstructor(dim, h, T0, TS, Q_expr)

b = zeros(dim,1);

for i = 1:dim

    switch i
        case 1
            add = -T0;
        case dim
            add = -TS;
        otherwise
            add = 0;
    end
    b(i) = h^2*Q_expr(h*i) + add;
end

end