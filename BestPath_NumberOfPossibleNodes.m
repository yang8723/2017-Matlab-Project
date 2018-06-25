function [possibleNodes] = BestPath_NumberOfPossibleNodes(sourceNode,E)
% The BestPath_NumberOfPossibleNodes function determines the possible

%Determining the size of the elevation data,E
[rows,cols] = size(E);

% Recalling the BestPath_NodeToPosition function to convert the sourceNode
% value to a position on the elevation data
[NodeRows,NodeCols] = BestPath_NodeToPosition(sourceNode,E);

% There are two nodes I can move to when I'm at the top or bottom of the
% elevation data
if NodeRows == 0
    possibleNodes = [sourceNode + rows,sourceNode + row + 1];
elseif NodeRows > rows
    possibleNodes = [sourceNode + rows -1, sourceNode + rows];
    % There is only one possible node I can move to when I'm at the easterly
    % edge of the elevation data
elseif NodeCols == cols
    possibleNodes = 26;
else
    possibleNodes = [sourceNode + row -1,sourceNode + rows,sourceNode + row + 1];
end

end

