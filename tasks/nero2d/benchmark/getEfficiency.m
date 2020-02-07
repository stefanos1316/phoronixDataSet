function [E, S, T] = getEfficiency(baseFilename, np)
    T = zeros(np, 1);
    for i = 1:np
        filename = sprintf('%s%d.dat', baseFilename, i);
        T(i) = getAvgTime(filename, 25);
    end

    S = T(1)./T;
    procArray = 1:np;
    E = S./procArray';
end
