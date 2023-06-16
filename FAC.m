function [cyclelist,  e]  = FAC(G)
%need to pass G, cycles, numcycles

numcycles = 0;
cycles = {};
for i = 1:size(G, 1)
    for j = 1:2
        [G, cycles, numcycles, e, A] = FNC(G(i, j), G, cycles, numcycles);
        if A == 1
            Cedges = edgelist(cycles{end});
            cyclelist = Cedges;
            return
        end
    end
end

end

