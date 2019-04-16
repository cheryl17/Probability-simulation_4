a = [0, 0.1, 0.2, 0.3, 0.4, 0.5];
oneSecond = 10^6;
numberOfSecond = 5;
fprintf('For N=2');
fprintf('\n');
for i = 1 : length(a)
    p = a(i);
    s = [1, 2];
    pp = zeros(1, 2); 
    second = 1;
    cycle = 1;
    while second <= numberOfSecond
        while cycle <= oneSecond
            if s(1) ~= s(2)               
                pp(1) = pp(1) + 1;
                pp(2) = pp(2) + 1;
                s(1) = nextPacket(2, p);
                s(2) = nextPacket(2, p);
            else
                pp(s(1)) = pp(s(1)) + 1;
                winner = randi(2);
                if winner == 1
                    s(1) = nextPacket(2, p);
                else
                    s(2) = nextPacket(2, p);
                end            
            end
            cycle = cycle + 1;
        end
        second = second + 1;
        cycle = 1;
    end
    pp = pp ./ numberOfSecond;
    fprintf('a = %.1f\n', p);
    fprintf('Throughput of each port: \n')
    for j = 1 : 2
        fprintf('Port%d: %d        ', j, round(pp(j)));
    end
    fprintf('\n');
    throughput = sum(pp);
    fprintf('Throughput: %d  ', round(throughput));  
    efficiency = throughput / (2 * oneSecond);
    fprintf('Efficiency: %.3f\n', efficiency);
    fprintf('\n');
end