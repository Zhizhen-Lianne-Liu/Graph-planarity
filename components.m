function [B, s] = components(G, N)
    %This function aims to find the components of G
    %N = max(G, [], 'all'); %number of vertices of graph
    
    V = zeros(N, 1); %If i th vertex is visited, then ith element is 1.
    
    count = 0;
    
    comps = {}; %list of all the components, with vertices of each components in a different subarray
    
    for i = 1:N
        if V(i) ==0
            V(i) = 1;
            count  = count + 1;
            neighbours = [i];
            [comp1, V] = searchNeighbours(G, i, V, neighbours, N);
            comps{count} = comp1;
        end
    end
    B = comps;
    s = count;
end




