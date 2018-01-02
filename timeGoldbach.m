function timeGoldbach(vals)
    sorted_vals = sort(vals,'ascend');
    times = zeros(1,length(sorted_vals));
    for i=1:length(sorted_vals)
        tic
        goldbach(sorted_vals(i));
        times(i) = toc;
    end
    plot(sorted_vals,times)
    title(['Goldbach time tests up to ', num2str(max(vals))])
    xlabel('Function values (goldbach(x))')
    ylabel('Time to run (seconds)')
end