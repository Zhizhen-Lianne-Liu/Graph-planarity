function [G, cycles, numcycles, e, A] = FNC(path, G,cycles, numcycles)
s = path(1);%starting vertex
next = nan;%next vertex
A = 0;
e = [0;0];
%visit each edge and each node of each edge
for i = 1:size(G, 1)
    n1 = G(i, 1);
    n2 = G(i, 2);
    if ismember(s, G(i, :))
        if n1 == s
            next = n2;
        elseif n2 == s
            next = n1;
        end

        if ~(visited(next, path))
            %next vertex not on path
            temp = next;
            temp = [temp path];
            %now look at the longer path
            [G, cycles, numcycles, e, A] = FNC(temp, G, cycles, numcycles);
            if A == 1
                return
            end
        elseif size(path, 2) >= 3 && next == path(end)
            %cycle found, check if it has chord
            p = rotate(path);
            inv = invert(p);
            if isNew(p, cycles) && isNew(inv, cycles)
                numcycles = numcycles + 1;
                cycles{numcycles} = p;
                pedges = edgelist(p);
                [A, e] = checkChasChord(G, pedges);
                if A == 1
                    return
                end
            end
        end
    end

end

