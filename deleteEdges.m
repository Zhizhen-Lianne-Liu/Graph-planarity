function [Aoutput] = deleteEdges(A,path, e)
%delete any edges associated with vertices in path except those specified
%in e
for i = 1:size(path, 1)
    if ismember(path(i, 1), e) == 0
        A(path(i, 1), :) = 0;
        
        A(:, path(i, 1)) = 0;
        
    end
    if ismember(path(i, 2), e)==0
        A(path(i, 2), :) = 0;
        
        A(:, path(i, 2)) = 0;
    end
end
Aoutput = A;
end

