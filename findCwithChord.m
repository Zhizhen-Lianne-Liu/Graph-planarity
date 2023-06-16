function cycleOutput = findCwithChord(G)
N = max(G, [], 'all');
V = zeros(N, 1);%ijth element 1 if jth element visited with parent i
parents = zeros(N, 1);
A = adjacency(G, N);
CwithChord = [];
m = min(G, [], 'all');
%[comps, ~] = components(G, N);
for i = m:N
    if V(i) == 0
        [CwithChord, ~, B] = findCwithChordRecursion(G, i, V, A, -1, CwithChord, parents);
        if B == 1
            cycleOutput = CwithChord;
            return
        end
        %since B is 0, then the component connected to vertex i does not
        %contain cycle with chord.
%         for j = 1:size(comps, 2)
%             if ismember(i, comps{j})
%                 for k = 1:size(comps{j}, 2)
%                     V(comps{j}(k)) = 1;
%                 end
%             end
%         end
    end
end

end