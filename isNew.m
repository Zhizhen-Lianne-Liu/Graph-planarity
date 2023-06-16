function [B] = isNew(path, cycles)
B = 1;
for i = 1:size(cycles, 2)
    if size(path, 2) == size(cycles{i}, 2) && all(path == cycles{i})
        B = 0;
        break;
    end
end

