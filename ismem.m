function B = ismem(a, L)
L = L(:);
n = max(size(L));
L = sort(L);
B = 0;
upper = n;
lower = 1;
A = 0;
temp = mid(1,n);
while A == 0
    if temp == upper || temp == lower
        return
    end 
    if a > L(int64(temp))
        lower = temp;
        temp = mid(lower, upper);
    elseif a < L(int64(temp))
        upper = temp;
        temp = mid(lower, upper);
    elseif a == L(int64(temp))
        B = 1;
        return
    end
    
end