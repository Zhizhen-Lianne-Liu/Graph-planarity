function BoolOutput = checkBipartite(H)
%function determines whether H is bipartite, 1 if Yes, 0 if no.
N = max(H, [], 'all');
A = adjacency(H, N);%adjacency matrix of H
V = zeros(N, 1);%1 if ith vertex of H is visited, 0 otherwise
colouring = zeros(N, 1);%colour vertex i 1 or 2

for i = 1:N
    if V(i) == 0
        colouring(i) = 1;
        V(i) = 1;
        neighs = find(A(i, :) == 1);
        if size(neighs, 2) ~= 0
            [V, colouring] = assignNeighColor(H, A, V, colouring, neighs, 2);
        end
    end
end

%now check if any neighbouring points have the same colour
bool = 1;
for i = 1:N
    neighscheck = find(A(i, :) == 1); %the neighbours of i which we will check
    if size(neighscheck, 2) ~= 0
        for j = 1:size(neighscheck, 2)
            if colouring(i) == colouring(neighscheck(j))
                bool = 0;
            end
        end
    end
end
BoolOutput = bool;


end