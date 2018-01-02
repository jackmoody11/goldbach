% As re-expressed by Euler, an equivalent form 
% of this conjecture (called the "strong" or "binary" 
% Goldbach conjecture) asserts that all positive even 
% integers n >= 4 can be expressed as the sum of two primes

% This function plots the number of unique ways
% to write any even number as the sum of two primes

% ** Note: The plot displays the number of unique ways
% to write the even number n as n/2 on the x-axis.
function goldbach(x)
    tf = isprime(1:x);
    primes_ltx = find(tf == 1); % make matrix with all primes less than x
    goldbach_tf = zeros(1,x);  % test goldbach logical
    goldbach_tf(1:2:x) = 1; % set all odds equal to true
    goldbach_tf(2) = 1; % set 2 to true
    uniq_goldbach = zeros(1,floor(length(x/2)));
    for i=1:x
        if ~(mod(i,2) == 1) && ~(i==2) % if odd, don't worry about goldbach
            % Check if even number can be written as sum of two primes
            % Count unique number of ways to write as sum of two primes
            uniq_goldbach((i/2) - 1) = 0;
            for j = 1:length(primes_ltx)
                if primes_ltx(j) > i/2 % account for symmetry
                    break % break if primes are greater than i
                end
                
                if (isprime(i - primes_ltx(j)))
                    goldbach_tf(i) = 1; % i satisfies goldbach
                    uniq_goldbach((i/2) - 1) = uniq_goldbach((i/2) - 1) + 1; % add to number of unique primes count
                end
            end
        end
    end
    figure('Name',['goldbach(', num2str(x),')'],'NumberTitle','off');
    xaxis = [4:2:2*floor(x/2)];
    plot(xaxis,uniq_goldbach);
    xlabel('Number');
    ylabel('Unique Goldbach Sums');
    title(['Unique Goldbach pairs (for evens) up to ', num2str(x)]);
end