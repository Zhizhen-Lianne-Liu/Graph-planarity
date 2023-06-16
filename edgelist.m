function [edges] = edgelist(cycle)
edges = [];
for i = 1:size(cycle, 2)-1
    edges = [edges ;cycle(i),cycle(i+1)];
end
edges = [edges; cycle(end), cycle(1)];

