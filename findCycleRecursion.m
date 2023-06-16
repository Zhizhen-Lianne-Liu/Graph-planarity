function [cycleOutput, Voutput, Boutput] = findCycleRecursion(v, V, A, parent, cycle, parents)
V(v) = 1;
parents(v) = parent;
neighs = find(A(v, :) == 1);
B = 0;
childSuccess = -1;
for i = 1:size(neighs, 2)
    if V(neighs(i)) == 0
        [cycle, V, B] = findCycleRecursion(neighs(i), V, A, v, cycle, parents);
        if B == 1
            %childSuccess = neighs(i);
            %cycle = [cycle; [v, childSuccess]];
            Boutput = B;
            Voutput = V;
            cycleOutput = cycle;
            return
        end
    elseif neighs(i) ~= parent
        
        B = 1;
        parents(neighs(i)) = v;
        
        cur = neighs(i);
        cycle = [cycle; [cur, parents(cur)]];
        cur = parents(cur);
        while cur ~= neighs(i)
            cycle = [cycle; [cur, parents(cur)]];
            cur = parents(cur);
        end
        
        %childSuccess = neighs(i);
        %cycle = [cycle; [v, childSuccess]];

        Boutput = B;
        Voutput = V;
        cycleOutput = cycle;
        return
        %childSuccess = neighs(i);
    end
end
Boutput = B;
Voutput = V;
cycleOutput = cycle;
end