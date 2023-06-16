function [inverted] = invert(path)
inverted = rotate(path(end:-1:1));
end

