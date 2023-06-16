function output = adjacency(G, N)
%this function finds the adjacency matrix from the edge list.
%N = max(G, [], 'all');
A = zeros(N, N);

n = size(G, 1); %number of elements of edge list

for i = 1:n
    A(G(i, 1), G(i, 2)) = 1;
    A(G(i, 2), G(i, 1)) = 1;
    
end
output = A;
end