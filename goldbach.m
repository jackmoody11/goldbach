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
    primes_ltx = zeros(1,sum(tf)); % preload size of matrix of primes 
                                   % less than x (will need to
                                   % check performance using tic toc)
    primes_ltx = find(tf == 1); % make matrix with all primes less than x
    goldbach_tf = zeros(1,x);  % test goldbach logical
    for i=1:x
        if (mod(i,2) == 1) % if odd, don't worry about goldbach
            goldbach_tf(i) = 1;
        elseif (i == 2) % Only check even numbers greater than or equal to 4
            goldbach_tf(i) = 1;
        else
            % Check if even number can be written as sum of two primes
            % Count unique number of ways to write as sum of two primes
            uniq_goldbach((i/2) - 1) = 0;
            for j = 1:length(primes_ltx)
                if primes_ltx(j) > i
                    break % break if primes are greater than i
                end
                
                if (isprime(i - primes_ltx(j)))
                    goldbach_tf(i) = 1;
                    uniq_goldbach((i/2) - 1) = uniq_goldbach((i/2) - 1) + 1;
                end
            end
        end
    end
    plot(uniq_goldbach)
end