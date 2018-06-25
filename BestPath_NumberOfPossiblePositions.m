function [possibleNodes] = BestPath_NumberOfPossiblePositions(sourceNode,E)


[rows,cols] = size(E);

[NodePosition] = BestPath_NodeToPosition(sourceNode,E);

if NodeRows == 0 || NodeRows> rows % Only two paths I can take
    possibleNodes = [sourceNode + rows,sourceNode + row + 1];
elseif NodeCols == cols % Only one path I can take
    possibleNodes = 26;
else % Can take all 3 pathes
    possibleNodes = [sourceNode + row -1,sourceNode + rows,sourceNode + row + 1];
end

end

