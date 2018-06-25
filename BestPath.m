function [pathRows,pathCols,pathElev] = BestPath(E)
% The BestPath function will find the best possible path across the map
% Input =  E, elevation data stored in a 2D m x n matrix
% Output = pathRows, A 1D array representing containing the row indices of 
%          the path
%          pathCols, A 1D array representing containing the column indices 
%          of the path
%          pathElev, A 1D array containing the elevations for the 
%          corresponding row and column indices 
% Author = Hyesu Yang 215043376
% Reference = Dijkstra's Algorithm 

% Recalling the BestPath_CostMatrix function to get the 1D array of 
[TargetNode] = BestPath_CostMatrix(E);

% Convert the node values to positions
[NodePosition] = BestPath_NodeToPosition(TargetNode,E);

% Calculating the pathRows and pathCols of the best path 
pathRows = NodePosition(1);
pathCols = NodePosition(2);

% Pre-allocating a zeros array
pathElev = zeros(1,length(pathCols));

% Calculating the pathElev of the best path 
for i = 1:length(pathCols)
    pathElev(i) = E(pathRows(i),pathCols(i));
end 

end

