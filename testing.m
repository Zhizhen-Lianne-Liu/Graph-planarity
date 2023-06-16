function [C, e] = testing(G)
[Cycles, numcycles] = FAC(G);

for i = 1:numcycles
    [A, e] = checkChasChord(G, Cycles{i});
    if A == 1
        C = Cycles{i};
        return
    end
end
end

