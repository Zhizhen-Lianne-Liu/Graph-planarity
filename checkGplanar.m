function B = checkGplanar(G)
Gcore = findCore(G);

if size(Gcore, 1) == 0
    B = 1;
    return
end

% C = findCwithChord(Gcore);
% [~, e] = checkChasChord(Gcore, C);
[C, e] = FAC(Gcore);

H = interleave(Gcore, C);

isHbipartite = checkBipartite(H);

if isHbipartite == 0
    B = 0;
    return
end

%after everything, find G^* - e
Gnew = Gcore;
for i = size(Gnew, 1):-1:1
    if (sort(Gnew(i, :)) == sort(transpose(e)))
        Gnew(i, :) = [];
    end
end


B = checkGplanar(Gnew);

end