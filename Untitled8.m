G = [1,2;2,3;3,4;4,5;5,1;1,3;2,4];
searchCycles(G);

function cycleList = searchCycles(edgeMap)

    tic
    global graph cycles numCycles;
    graph = edgeMap;
    numCycles = 0;
    cycles = {};
    for i = 1:size(graph,1)
        for j = 1:2
            findNewCycles(graph(i,j))
        end
    end
    % print out all found cycles
    for i = 1:size(cycles,2)
        cycles{i}
    end
    % return the result
    cycleList = cycles;
    toc
end

function findNewCycles(path)

    global graph cycles numCycles;
    startNode = path(1);
    nextNode = nan;
    sub = [];

    % visit each edge and each node of each edge
    for i = 1:size(graph,1)
        node1 = graph(i,1);
        node2 = graph(i,2);
        if node1 == startNode
            nextNode = node2;
        elseif node2 == startNode
            nextNode = node1;
        end
        if ~(visited(nextNode, path))
            % neighbor node not on path yet
            sub = nextNode;
            sub = [sub path];
            % explore extended path
            findNewCycles(sub);
        elseif size(path,2) > 2 && nextNode == path(end)
            % cycle found
            p = rotate_to_smallest(path);
            inv = invert(p);
            if isNew(p) && isNew(inv)
                numCycles = numCycles + 1;
                cycles{numCycles} = p;
            end
        end
    end
end

function inv = invert(path)
    inv = rotate_to_smallest(path(end:-1:1));
end
% rotate cycle path such that it begins with the smallest node
function new_path = rotate_to_smallest(path)
    [~,n] = min(path);
    new_path = [path(n:end), path(1:n-1)];
end
function result = isNew(path)
    global cycles
    result = 1;
    for i = 1:size(cycles,2)
        if size(path,2) == size(cycles{i},2) && all(path == cycles{i})
            result = 0;
            break;
        end
    end
end
function result = visited(node,path)
    result = 0;
    if isnan(node) && any(isnan(path))
        result = 1;
        return
    end
    for i = 1:size(path,2)
        if node == path(i)
            result = 1;
            break
        end
    end
end

