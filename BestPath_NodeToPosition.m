function [NodePosition] = BestPath_NodeToPosition(sourceNode,E)
% The BestPath_NodeToPosition functioon gets the single value sourceNode and
% converts it to a position (rows,cols) on the elevation data, E
% Input = sourceNode, positive integer values
%         E, elevation data matrix
% Output = NodePosition,a 1D array of the position of the node (rows,cols)
% Author = Hyesu Yang, 215043376

%Determining the size of the elevation data,E
[rows,~] = size(E);

division = (sourceNode-1)/rows;

% When the NodeValue is on the last row of the elevation data, this is how
% we calculates the NodeCols of the NodePosition
if division == floor(division)
    NodeCols = floor(division)+1;
else
    NodeCols = floor(division) + 2;
end

% Calculates the NodeRows
if sourceNode == 1
    NodeRows = 1;
else
    NodeRows = sourceNode - 1 - rows*(NodeCols-2);
end 

% Calculates the position of the node by storing it in a 1D array
NodePosition = [NodeRows,NodeCols];
end

