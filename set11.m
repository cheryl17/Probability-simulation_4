j = 10000;  % j can be changed to 100,1000,10000
n = zeros(1,j);
m = 1000; % m can be changed to 5,50,100,1000
for i = 1:j
    s = 0;
    for k = 1:m
        a = rand();
        if a > 0.5
            s = s+1;
        end
    end
    n(i) = s;
end
    x = zeros(1,m);
    x = zeros(1,m);
    for k=1:m+1
        x(k) = k - 1;
        y(k) = nchoosek(m,k-1)*j*(0.5^m);
    end
    histogram(n)
    hold on
    plot(x,y)

            
