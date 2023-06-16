function [Voutput, colouringOutput] = assignNeighColor(H, A, V, colouring, neighs, c)
%c contains what we should colour elements in neighs

for i = 1:size(neighs, 2)
    if V(neighs(i)) == 0
        V(neighs(i)) = 1;
        colouring(neighs(i)) = c;
    end
    newneighs = find(A(neighs(i), :) == 1);
    %but this is all neighbours, we want to take out ones already visited
    for j = size(newneighs, 2):-1:1
        if V(newneighs(j)) == 1
            newneighs(j) = [];
        end
    end
    [V, colouring] = assignNeighColor(H, A, V, colouring, newneighs, int64(mod(c, 2) + 1));
end

Voutput = V;
colouringOutput = colouring;

end