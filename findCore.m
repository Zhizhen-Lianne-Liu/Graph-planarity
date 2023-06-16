function coreOutput = findCore(G)

N = max(G, [], 'all');
A = adjacency(G, N);
degrees = sum(A, 2);%degrees of each vertex
B = ismember(1, (degrees <= 2 & degrees > 0));
%B is 1 if there is a vertex of degree <= 2, 0 otherwise.

while B == 1
    i = find((degrees <= 2 & degrees > 0), 1);
    neighs = find(A(i, :) == 1); %find neighbouring vertices of vertex i;
    A(i, :) = zeros(1, N);
    A(:, i) = zeros(N, 1);
    if size(neighs, 2) == 2
        A(neighs(1), neighs(2)) = 1;
        A(neighs(2), neighs(1)) = 1;
    end
    degrees = sum(A, 2);
    B = ismember(1, (degrees <= 2 & degrees > 0));
end

coreOutput = AtoG(A);

end