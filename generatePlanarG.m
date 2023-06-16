function [Goutput, firstViolation] = generatePlanarG(N)
%returns a maximal planar graph of size N
G = [];
firstViolation = 0;
%first generate edge list for complete graph
edges = [];
for i = 1:N
    for j = i+1:N
        edges = [edges; [i, j]];
    end
end
%now randomly permute the edge list
edges = edges(randperm(size(edges, 1)), :);

%now try adding each edge in edgelist to G and check if planar each time
for i = 1:size(edges, 1)
    Gtemp = G;
    Gtemp = [edges(i, :); Gtemp];
    B = checkGplanar(Gtemp);
    if B == 1
        G = Gtemp;
    end
    if B == 0 && firstViolation == 0
        firstViolation = i;
    end
    if size(G,  1) == 3*N - 6
        break
    end
end

Goutput = G;
end