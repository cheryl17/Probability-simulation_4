N = 8; % N could be changed
oneSecond = 10^6; 
numberOfSecond = 1; 
fprintf('For N=%d \n',N); 
for i = 2 : N
    p = 1/i;  
    s = zeros(1, N);  
    for j = 1 : N
        s(j) = j;
    end
    pp = zeros(1, N);
    second = 1;
    cycle = 1;
    key = zeros(1, N);
    for j = 1 : N
        key(j) = j;
    end
    val = cell(1, N);      
    for j = 1 : N
        val{j} = [0, j];
    end    
    M = containers.Map(key, val);    
    while second <= numberOfSecond
        while cycle <= oneSecond  
            add = zeros(N, 2);
            addNum = 1;
            for j = 1 : N
                candidate = M(j);
                total = length(candidate);
                if total == 1
                    continue;
                end
                winner = randi(total-1) + 1;
                newPacket = nextPacket(N, p);
                s(candidate(winner)) = newPacket;
                add(addNum, 1) = newPacket;
                add(addNum, 2) = candidate(winner);
                addNum = addNum + 1;    
                candidate(winner) = [];
                M(j) = candidate;                 
                pp(j) = pp(j) + 1;
            end
            for j = 1 : addNum - 1
                port = add(j, 1);
                new = add(j, 2);
                M(port) = [M(port), new];
            end            
            cycle = cycle + 1;            
        end
        second = second + 1;
        cycle = 1;        
    end
    pp = pp ./ numberOfSecond;
    fprintf('k = %d -- ', i);
    if i ~= N
        fprintf('Hot-spot Traffic\n');
    else
        fprintf('Balanced Traffic\n')        
    end
    for j = 1 : N
        if mod(j, 5) == 0
            fprintf('\n');
        end
        fprintf('Port%d: %d || ', j, round(pp(j)));
    end
    fprintf('\n');    
    throughput = sum(pp);
    fprintf('Throughput: %d\n', round(throughput));    
    efficiency = throughput / (N * oneSecond);
    fprintf('Efficiency: %.4f\n', efficiency);
    fprintf('\n');    
end