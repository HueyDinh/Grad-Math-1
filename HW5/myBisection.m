function x_mid = myBisection(func, x_start, x_end, tol)

if x_start >= x_end
    error("Invalid Interval: End Points Ordering Violated")
end

f_start = func(x_start);
f_end = func(x_end);

if f_start*f_end >= 0
    error("Invalid Interval: Function at End Points Should Have Different Sign");
end
% Number of steps can be pre-calculated for bisection algorithm
num_iter = ceil(log2((x_end -x_start)/tol)); % ALways round up, otherwise tolerance will not be met (1 step short)

% Debug table allocation
iter_index_list = (0:num_iter)';
x_start_list = zeros(num_iter + 1,1);
f_start_list = zeros(num_iter + 1,1);
x_end_list = zeros(num_iter + 1,1);
f_end_list = zeros(num_iter + 1,1);
e_list = zeros(num_iter + 1,1);

x_mid = (x_start + x_end) / 2;
f_mid = func(x_mid);

x_start_list(1) = x_start;
x_end_list(1) = x_end;
e_list(1) = x_end - x_start;

for iter = 1:num_iter

    if f_mid*f_start < 0
        x_end = x_mid;
    else
        x_start = x_mid; 
    end
    
    % Logging
    x_start_list(iter + 1) = x_start;
    f_start_list(iter + 1) = f_start;
    x_end_list(iter + 1) = x_end;
    f_end_list(iter + 1) = f_end;
    e_list(iter + 1) = x_end - x_start;

    x_mid = (x_start + x_end)/2;
    f_start = func(x_start);
    f_end = func(x_end);
    f_mid = func(x_mid);

end

debug_table = table(iter_index_list, x_start_list, f_start_list, x_end_list, f_end_list, e_list);

disp(debug_table)

end