function A = AConstructor(dim, alpha, h)

A = zeros(dim,dim);

for i = 1:dim
    A(i,i) = -(2+(alpha*h)^2);
    switch i
        case 1
            A(i,i+1) = 1;           
        case dim
            A(i,i-1) = 1;
        otherwise
            A(i,i+1) = 1;
            A(i,i-1) = 1;
    end
end

end