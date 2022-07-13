function [x, xp] = makeArrayInter(days, size)
    x = 1:days:size-1;
    xp = 1:size;
    xp = xp(~ismember(xp,x));
end