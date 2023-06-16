function m = mid(l, u)
t = l + u;
if mod(t, 2) == 1
    mid = (t - 1)/2;
else
    mid = t / 2;
end
m = int64(mid);

end