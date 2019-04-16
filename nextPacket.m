% nextPacket.m
function port = nextPacket(N, p)
    if rand() < p
        port = 1;
    else
        port = randi(N-1) + 1;
    end
end