function [B, chord] = checkChasChord(G, cycle)
%function returns B = 1 if cycle has chord, 0 otherwise
N = max(G, [], 'all');
B = 0;
chord = [];
[bridges, attachV] = findBridges(G, cycle);
        
n = size(bridges, 2); % records number of bridges
l = size(cycle, 1);%length of cycle

K = [];%to equal the vertices not in cycle
inC = [];%to equal vertices in cycle
for k = 1:N
    if ismember(k, cycle) == 0
        K = [K; k];
    else
        inC = [inC; k];
    end
end

for m = 1:n
    if size(bridges{m}, 1) == 1
        if size(attachV{m}, 1) == 2
            %now check if the two points of attachment are on cycle
            if ismember(attachV{m}(1), inC) && ismember(attachV{m}(2), inC)
                B = 1;
                chord = attachV{m};
            end
        end
    end

end

end