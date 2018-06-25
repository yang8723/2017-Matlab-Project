function [sourceNode] = BestPath_PositionToNode(NodePosition,E)
% The BestPath_PositionToNode function converts possible_positions a 1D
% array back into the sourceNode (Integer value)
% Input = NodePosition, a 1D array of the position of the node (rows,cols)
%         E, elevation data
% Output = sourceNode, the current node we are at (positive integer)
% Author = Hyesu Yang 215043376

% Determining the size of the elevation data,E
[rows,~] = size(E);

% Determining the row and column value of the node position
NodeRows = NodePosition(1);
NodeCols = NodePosition(2) -1;

% Converting the node position back to the node value
sourceNode = NodeRows +rows*(NodeCols-1) +1;

end

