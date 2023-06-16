function cycleOutput = findCycle(G)
N = max(G, [], 'all');
V = zeros(N, 1);%ith element 1 if ith vertex visited, 0 otherwise
A = adjacency(G, N);
parents = zeros(N, 1);
cycle = [];
for i = 1:N
    if V(i) == 0
        [cycle, V, B] = findCycleRecursion(i, V, A, -1, cycle, parents);
        if B == 1
            cycleOutput = cycle;
            return
        end
    end
end

end