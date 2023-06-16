function [B] = visited(v, path)
B = 0;
if isnan(v) && any(isnan(path))
    B = 1;
    return
end

for i = 1:size(path, 2)
    if v == path(i)
        B = 1;
        break
    end
end

