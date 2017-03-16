% EdgeTest
% by Baihan Lin, Baker Lab
% Mar 2017

clear all;
close all;

rng(378);                 % randomizer

% Edge Outline

A = [ 1 2 2 2 1 1;
      1 1 1 2 2 1;
      1 2 2 2 1 1;
      1 2 1 1 1 2;
      1 2 2 1 1 1;
      1 3 4 2 1 1;
      1 2 2 3 1 1];
  
edge = outEdge(A);

% Segmented Images
  
B = zeros(7,6);

M1 = 11*ones(7, 6);
M1 = 22*ones(7, 6);
M1 = 33*ones(7, 6);
M1 = 44*ones(7, 6);

seg = [ 1 2 2 2 1 1;
        1 1 1 2 2 1;
        1 2 2 2 1 1;
        1 2 1 1 1 2;
        1 2 2 1 1 1;
        1 3 4 2 1 1;
        1 2 2 3 1 1];

key = unique(seg);
nSeg = length(key);
colorSeg = floor(0:255/nSeg:255);

for n = 1:nSeg
    
[seg == key(n)]

end
