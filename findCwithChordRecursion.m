function [cycleOutput, Voutput, Boutput] = findCwithChordRecursion(G, v, V, A, parent, cycle, parents)
%now instead of returning once cycle is found, return only when cycle with
%chord is found
V(v) = 1;
parents(v) = parent;
neighs = find(A(v, :) == 1);
B = 0;
for i = 1:size(neighs, 2)
    if V(neighs(i)) == 0
        V(neighs(i))
        [cycle, ~, B] = findCwithChordRecursion(G, neighs(i), V, A, v, cycle, parents);
        if B == 1
            Boutput = B;
            Voutput = V;
            cycleOutput = cycle;
            return
            
        end
        
        %V(neighs(i)) = 1;
%         if B == 0
%             V(v) = 0;
%         end
        
    elseif neighs(i) ~= parent
        cycle = [];
        ptemp = parents;
        ptemp(neighs(i)) = v;
        
        cur = neighs(i);
        cycle = [cycle; [cur, ptemp(cur)]];
        cur = ptemp(cur);
        while cur ~= neighs(i)
            cycle = [cycle; [cur, ptemp(cur)]];
            cur = ptemp(cur);
        end
        
        [DoesChaveChord, ~] = checkChasChord(G, cycle);
        
        if DoesChaveChord == 1
            B = 1;
            Boutput = B;
            Voutput = V;
            cycleOutput = cycle;
            return
        end 
        
    end
end

Boutput = B;
Voutput = V;
cycleOutput = cycle;

end