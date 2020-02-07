function [T] = getAvgTime(filename, ns)
  F = load(filename);
  Total = 0;
  for j = 1:ns
    Total = Total + F(2*j+3,2);
  end
  T = Total/ns;
end
