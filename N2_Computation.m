a = [0, 0.1, 0.2, 0.3, 0.4, 0.5];
oneSecond = 10^6;
res = zeros(length(a), 4);
for i = 1 : length(a)
    p = a(i);
    matrix = [p,   (1-p)/2, (1-p)/2, 0;
              p^2, p*(1-p), p*(1-p), (1-p)^2;
              p^2, p*(1-p), p*(1-p), (1-p)^2;
              0,   p/2,     p/2,     1-p];
    syms x1 x2 x3 x4
    sol = [x1, x2, x3, x4];
    eqns = [sol == sol * matrix, sum(sol) == 1];
    re = solve(eqns, sol);
    res(i, 1) = re.x1;
    res(i, 2) = re.x2;
    res(i, 3) = re.x3;
    res(i, 4) = re.x4;    
    throughput = oneSecond * (1 * res(i, 1) + 2 * res(i, 2) + 2 * res(i, 3) + 1 * res(i, 4));
    efficiency = throughput / (2 * oneSecond);
    fprintf('a = %.1f\n', p);
    fprintf('Throughput: %d --- Efficiency: %.4f\n', round(throughput), efficiency);
    fprintf('\n');
end
