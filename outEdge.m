% by Baihan Lin
% Mar 2017

function edge = outEdge(A)

edge = zeros(size(A));
edge(1:end-1,:) = A(1:end-1,:) - A(2:end,:); 
edge = [edge ~= 0];

end
