clear

%first implementing/testing the program for finding components
%
% G = [[1, 2]; [2, 3]; [3, 1]; [4, 5];[6, 7]; [7, 3]; [6, 2]];

p20 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_20.txt');

G = p20;

N = max(G, [], 'all');

%[comp, numOfComp] = components(G, N);
%
%where comp is the specific components and numOfComp is the number of
%components in G


%Then for the program to finding bridges:
%we want to delete edges of C from G, find the non-singular components, then find which
%points in the non-singular components are connected to C. 
%actually isolated points wouldn't have been considered anyway in the
%edgelist.
%since if a component was singular it is either a vertex of C not connected
%to any vertices outside of C, or it was an isolated vertex to begin with,
%in which case it is not a bridge to begin with
%since bridges are a set of edges, we also want to turn the components
%vertices back to which edges they associate with in G.
% N = max(G, [], 'all'); %number of vertices of graph
% C = [[1, 2];[2, 3];[3, 1]];
% K = [];%to equal the vertices not in cycle
% inC = [];%to equal vertices in cycle
% for i = 1:N
%     if ismember(i, C) == 0
%         K = [K; i];
%     else
%         inC = [inC; i];
%     end
% end
% 
% GnoC = G; %will contain edges of G not including edges of C
% 
% for j = 1:size(C, 1)
%     index = find(ismember(GnoC,C(j, :),'rows'));
%     GnoC(index, :) = [];
% end
% 
% %now find the components of GnoC:
% [bridgesVertices, n] = components(GnoC);
% %where bridgesVertices are the vertices in the bridges, and n is useless.
% 
% 
% %now delete singular components of bridgesVertices
% for i = size(bridgesVertices, 2):-1:1
%     if size(bridgesVertices{i}, 2) == 1
%         bridgesVertices(:, i) = [];
%     end
% end
% 
% 
% %now determine which edges are in the bridges
% bridges = {}; %contains the edges lists for all bridges
% 
% 
% for j = 1:size(bridgesVertices, 2)
%     temp = [];
%     for i = 1:size(G, 1)
%         if ismember(G(i, 1), bridgesVertices{j}) && ismember(G(i, 2), bridgesVertices{j})
%             temp = [temp; G(i, :)];
%         end
%     end
%     bridges{j} = temp;
% end
% 
% 
% %Now find vertices of Attachment using bridgesVertices:
% attachV = [];%contains list of vertices of attachment
% for i = 1:size(inC, 1)
%     for j = 1:size(bridgesVertices, 2)
%         if ismember(inC(i), bridgesVertices{j})
%             attachV = [attachV; inC(i)];
%         end
%     end
% end

% C = [1,2;2,3;3,4;4,1];
% bridges = findBridges(G, C);

G = [6,7;6,26;6,38;7,26;7,38;26,38; 38, 40;6, 13;13, 26];
C = [6,38;38,26;26,7;7,6];

[bridges, attachV] = findBridges(G, C);


