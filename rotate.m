function [pathOutput] = rotate(path)
%rotates path so it starts with smallest vertex
[~, i] = min(path);
pathOutput = [path(i:end), path(1: i-1)];
end

