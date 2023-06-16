function Houtput = interleave(G, C)
%
Nc = max(C, [], 'all');
Ac = adjacency(C, Nc);%adjacency matrix of cycle C
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


[bridges, attachV] = findBridges(G, C);
%bridge i 's edge list is stored in bridges{i}

%now for each pair of bridges go along C to check the order of attachments 
%and determine if any of the bridges interlace.

n = size(bridges, 2); % records number of bridges
l = size(C, 1);%length of cycle

H = []; %will contain set of edges in H

for i = 1:n
    for j = (i+1):n
        V = zeros(l, 1);%ith element 1 if vertex inC(i) was visited, 0 otherwise.
        currentV = 1; %current vertex we are on is inC(1)
        attachOrder = '';%append a if attach
        for k = 1:l
            V(currentV) = 1;
            if ismember(inC(currentV), attachV{i})==1 && ismember(inC(currentV), attachV{j})==0
                if size(attachOrder, 1) == 0
                    attachOrder = append(attachOrder, 'a');
                elseif attachOrder(1, size(attachOrder,2)) ~= 'a'
                    attachOrder = append(attachOrder, 'a');
                end
            elseif ismember(inC(currentV), attachV{i})==0 && ismember(inC(currentV), attachV{j})==1
                if size(attachOrder, 1) == 0
                    attachOrder = append(attachOrder, 'b');
                elseif attachOrder(1, size(attachOrder,2)) ~= 'b'
                    attachOrder = append(attachOrder, 'b');
                end
            elseif ismember(inC(currentV), attachV{i})==1 && ismember(inC(currentV), attachV{j})==1
                attachOrder = append(attachOrder, 'c');
            end
            %now look through all neighbours of currentV in C and go to
            %which ever is unvisited.
            neighs = find(Ac(inC(currentV), :) == 1); %find neighbouring vertices of vertex inC(currentV)
            for m = 1:size(neighs, 2)
                tempindex = find(inC == neighs(m));
                if V(tempindex) == 0
                    currentV = tempindex;
                end
            end
        end
        
        if count(attachOrder, 'c') >= 3 
            H = [H; [i, j]];
        else
            tempAV = '';
            %get rid of duplicates of C in string
%             for p = 1:size(attachOrder, 2)
%                 if size(tempAV, 1) == 0
%                     tempAV = append(tempAV, attachOrder(p));
%                 elseif attachOrder(1, p) == 'c'
%                     if tempAV(1, size(tempAV, 2)) ~= 'c'
%                         tempAV = append(tempAV, attachOrder(p));
%                     end
%                 else
%                     tempAV = append(tempAV, attachOrder(p));
%                 end
%             end
%             attachOrder = tempAV;
            interleave = 0;
            for p = 1:size(attachOrder, 2)-3
                if attachOrder(1, p) == 'a' | attachOrder (1, p) == 'c'
                    if attachOrder(1, p+1) == 'b' | attachOrder (1, p+1) == 'c'
                        if attachOrder(1, p+2) == 'a' | attachOrder (1, p+2) == 'c'
                            if attachOrder(1, p+3) == 'b' | attachOrder (1, p+3) == 'c'
                                interleave = 1;
                                break
                            end
                        end
                    end
                end
                if attachOrder(1, p) == 'b' | attachOrder (1, p) == 'c'
                    if attachOrder(1, p+1) == 'a' | attachOrder (1, p+1) == 'c'
                        if attachOrder(1, p+2) == 'b' | attachOrder (1, p+2) == 'c'
                            if attachOrder(1, p+3) == 'a' | attachOrder (1, p+3) == 'c'
                                interleave = 1;
                                break
                            end
                        end
                    end
                end
            end
   
%             if (contains(attachOrder, 'abab')  == 1) | (contains(attachOrder, 'baba') == 1) ...
%                 |  (contains(attachOrder, 'acac') == 1) ...
%                 | (contains(attachOrder, 'caca') == 1) | (contains(attachOrder, 'bcbc') == 1) ...
%                 | (contains(attachOrder, 'cbcb') == 1)| (contains(attachOrder, 'abcb') == 1)...
%                 | (contains(attachOrder, 'cbab') == 1)| (contains(attachOrder, 'baca') == 1)...
%                 | (contains(attachOrder, 'caba') == 1)
%                 H = [H; [i, j]];
%             end

            if interleave == 1
                H = [H; [i, j]];
            end
        end
        
    end
end


% %%Backup method
% %
% combis = nchoosek(inC, 4);
% combis = orderC(combis, C);
% 
% 
% for j = 1:n
%     for k = j+1:n
%         interleavebool = 0;
%         for i = 1:size(combis, 1)
%             threeOcc = 0;%counting for the alternative defn of interleavement
%             cur = combis(i, 1);
%             if ismember(cur, attachV{j})
%                 cur = combis(i, 2);
%                 if ismember(cur, attachV{k})
%                     cur = combis(i, 3);
%                     if ismember(cur, attachV{j})
%                         cur = combis(i, 4);
%                         if ismember(cur, attachV{k})
%                             interleavebool = 1;
%                             break
%                         end
%                     end
%                 end
%             end
%             cur = combis(i, 1);
%             if ismember(cur, attachV{k})
%                 cur = combis(i, 2);
%                 if ismember(cur, attachV{j})
%                     cur = combis(i, 3);
%                     if ismember(cur, attachV{k})
%                         cur = combis(i, 4);
%                         if ismember(cur, attachV{j})
%                             interleavebool = 1;
%                             break
%                         end
%                     end
%                 end
%             end
%             
%             if interleavebool == 0
%                 for p = 1:size(inC, 1)
%                     if ismember(inC(p), attachV{k}) && ismember(inC(p), attachV{j})
%                         threeOcc = threeOcc + 1;
%                         if threeOcc == 3
%                             break
%                         end
%                     end
%                 end
%             end
%             
%             
%         end
%         if interleavebool ==1 || threeOcc >= 3
%                 H = [H; [k, j]];
%         end
%     end
% end


Houtput = H;
end