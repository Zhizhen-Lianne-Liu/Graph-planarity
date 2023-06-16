function Goutput = AtoG(A)
%This function converts an adjacency matrix to the edge list of a graph
N = size(A, 1);
G = [];

for i = 1:N
    for j = (i+1):N
        if A(i, j) == 1
            G = [G; [i, j]];
        end
    end
end
Goutput = G;
end