function [colourOutput, parentOutput, cyclesOutput, CnumOutput] = findAllCycles(u, p, colour, parent,cycles, cyclenumber, A)
%function called to find all cycles in G

%already (completely) visited vertex
if colour(u) == 2
    colourOutput = colour;
    parentOutput = parent;
    cyclesOutput = cycles;
    CnumOutput = cyclenumber;
    return %%%%%%%%check
end

%seen vertex, but was not completely visited -> cycle detected
%backtrack based on parents to find complete cycle
if colour(u) == 1
    v = [];
    cur = p;
    v = [v; p];
    
    while cur ~= u
        cur = parent(cur);
        v = [v; cur];
        
    end
    cycles{cyclenumber} = v;
    cyclenumber  = cyclenumber + 1;
    
    colourOutput = colour;
    parentOutput = parent;
    cyclesOutput = cycles;%%%%%%%%%%%%check
    CnumOutput = cyclenumber;
    return
end
parent(u) = p;
colour(u) = 1;

neighs = find(A(u, :) == 1);


for i = 1:size(neighs, 2)
    if neighs(i) ~= parent(u)
        [colour, parent, cycles, cyclenumber] = findAllCycles(neighs(i), u, colour, parent, cycles, cyclenumber, A);
    end      
end
colour(u) = 2;

colourOutput = colour;
parentOutput = parent;
cyclesOutput = cycles;%%%%%%%%%%%%check
CnumOutput = cyclenumber;
end