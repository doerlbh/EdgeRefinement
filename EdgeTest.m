% EdgeTest
% by Baihan Lin, Baker Lab
% Mar 2017

clear all;
close all;

rng(378);                 % randomizer

A = [ 1 2 2 2 1 1;
      1 1 1 2 2 1;
      1 2 2 2 1 1;
      1 2 1 1 1 2;
      1 2 2 1 1 1;
      1 3 4 2 1 1;
      1 2 2 3 1 1]
  
edge = outEdge(A)
    