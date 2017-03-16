% BL_outEdge

% Author: Baihan Lin

function edge = BL_outEdge(A)

edge = zeros(size(A));
edge(1:end-1,:) = A(1:end-1,:) - A(2:end,:); 
edge = [edge ~= 0];
edge = uint8(edge);

end
