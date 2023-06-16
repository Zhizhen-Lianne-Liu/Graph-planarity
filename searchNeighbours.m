function [comp1, Voutput] = searchNeighbours(G, v, V, neighbours, N)
    %function aims to search the neighbours of vertex v. 
    %neighbours actually stores component data
    A = adjacency(G, N);%adjacency matrix

    %N = max(G, [], 'all'); %number of vertices of graph
    for j = 1:N
        if A(v, j) == 1 && V(j) == 0
            V(j) = 1;
            neighbours = [neighbours, j];
            [neighbours, V] = searchNeighbours(G, j, V, neighbours, N);
        end
    end
    comp1 = neighbours;
    Voutput = V;
end