function [bridgesOutput, attachVOutput] = findBridges(G, C)
N = max(G, [], 'all'); %number of vertices of graph
K = [];%to equal the vertices not in cycle
inC = [];%to equal vertices in cycle
for i = 1:N
    if ismember(i, C) == 0
        K = [K; i];
    else
        inC = [inC; i];
    end
end

GnoC = G; %will contain edges of G not including edges of C and edges connecting to C

for j = 1:size(C, 1)
    index = find(ismember(sort(GnoC, 2),sort(C(j, :)),'rows'));
    GnoC(index, :) = [];
end

%remove points of attachment and associated edges
for k = 1:size(inC, 1)
    for i = size(GnoC, 1):-1:1
        if GnoC(i, 1) == inC(k) || GnoC(i, 2) == inC(k)
            GnoC(i, :) = [];
        end
    end
end

%now find the components of GnoC:
[bridgesVertices, ~] = components(GnoC, N);
%where bridgesVertices are the vertices in the bridges, and n is useless.

%put back the edges connecting the bridges to cycle
% for j = 1:size(bridgesVertices, 2)
%     for i = 1:size(inC, 1)
%         for k = 1:size(bridgesVertices{j})
%             [res1, loc1] = ismember([bridgesVertices{j}(k), inC(i)], G, 'rows');
%             [res2, loc2] = ismember([inC(i), bridgesVertices{j}(k)], G, 'rows');
%             if res1 == 1 || res2 == 1
%                 temp = bridgesVertices{j};
%                 temp = [temp, ]
%             end
%         end
%     end
% end

%now delete singular components of bridgesVertices that are the vertices of
%the cycle
% for i = size(bridgesVertices, 2):-1:1
%     if size(bridgesVertices{i}, 2) == 1
%         if ismember(bridgesVertices{i}, inC)
%             bridgesVertices(:, i) = [];
%         end
%     end
% end


%now determine which edges are in the bridges
bridges = {}; %contains the edges lists for all bridges

for j = 1:size(bridgesVertices, 2)
    temp = [];
    for i = 1:size(G, 1)
        if ismember(G(i, 1), bridgesVertices{j}) && ismember(G(i, 2), bridgesVertices{j})
            temp = [temp; sort(G(i, :))];
        elseif ismember(G(i, 1), bridgesVertices{j}) && ismember(G(i, 2), inC) && ismember(G(i, 1), inC) == 0
            %if one vertex of edge is in bridge and another in cycle and
            %the edge is not in cycle and not chord
            
            [~, b] = ismember(G(i, 2), inC);
            temp = [temp; sort([G(i, 1), inC(b)])];
            
        elseif ismember(G(i, 2), bridgesVertices{j}) && ismember(G(i, 1), inC) && ismember(G(i, 2), inC) == 0
            
            [~, b] = ismember(G(i, 1), inC);
            temp = [temp; sort([G(i, 2), inC(b)])];
            
        end
    end
    bridges{j} = temp;
end

%add in chords as individual bridges
for i = 1:size(inC, 1)
    for j = i+1:size(inC, 1)
        if ismember(sort([inC(i), inC(j)]), sort(G, 2), 'rows')
            if ismember(sort([inC(i), inC(j)]), sort(C, 2), 'rows') == 0
                bridges{size(bridges, 2)+1} = [inC(i), inC(j)];
            end
        end
    end
end


%remove empty columns of bridges
for i = size(bridges, 2):-1:1
    if size(bridges{i}, 1) == 0
        bridges(:, i) = [];
    end
end

%delete duplicate bridges
for i = size(bridges, 2):-1:1
    for j = size(bridges, 2):-1:i+1
        if size(bridges{i}, 1) == size(bridges{j},1)
            if bridges{i} == bridges{j}
                bridges(:, j) = [];
            end
        end
    end
end


%Now find vertices of Attachment using bridgesVertices:
attachV = {};%contains list of vertices of attachment for each bridge
for j = 1:size(bridges, 2)
    temp = [];
    for i = 1:size(inC, 1)
        if ismember(inC(i), bridges{j})
            temp = [temp; inC(i)];
        end
    end
    attachV{j} = temp;
end

bridgesOutput = bridges;
attachVOutput = attachV;
end