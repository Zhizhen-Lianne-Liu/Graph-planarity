function combisOutput = orderC(combis, C)
saveC = C;
n = size(combis, 1);
k = size(C, 1);%size of cycle
temp = zeros(n, 4);

%first get vertices in cycle in order:
CV = [];%set of vertices of C in cycle order
cur = C(1, 1);
for i = 1:k
    CV = [CV; cur];
    if ismember(cur, C(:, 1))
        [~, b] = ismember(cur, C(:, 1));
        cur = C(b, 2);
        C(b, :) = [];
    elseif ismember(cur, C(:, 2))
        [~, b] = ismember(cur, C(:, 2));
        cur = C(b, 1);
        C(b, :) = [];
    end
end



for i = 1:n
    [~, a1] = ismember(combis(i, 1), CV);
    [~, a2] = ismember(combis(i, 2), CV);
    [~, a3] = ismember(combis(i, 3), CV);
    [~, a4] = ismember(combis(i, 4), CV);
    index = sort([a1, a2, a3, a4]);
    temp(i, :) = CV(index)';
end

combisOutput = temp;
end