function [pathRows,pathCols,pathElev] = BestGreedyPathHeadingEast(E)
% The BestGreedyPathHeadingEast function will find the best greedy path
% starting from the westerly edge. In the event of one or more paths tying
% for the lower cost, the path that starts with the lowest row number will
% be returned
% Input =  E, elevation data stored in a 2D m x n matrix
% Output = pathRows, A 1D array representing containing the row indices of
%          the path
%          pathCols, A 1D array representing containing the column indices
%          of the path
%          pathElev, A 1D array containing the elevations for the
%          corresponding row and column indices
% Author = Hyesu Yang 215043376


% Determining the size of the elevation data, E
[rows,cols] = size(E);

% We are always heading in the easterly direction
direction = 1;

% The column value for the starting position is always 1 since we are
% starting from the westerly edge
startingPosition(2) = 1;

% Pre-allocating a zeros array
costArray = zeros(1,rows);
pathElevArray = zeros(rows,cols);
pathRowsArray = zeros(rows,cols);
pathColsArray = zeros(rows,cols);

% Calculating a 1D array of pathRows and pathCols by recalling the
% GreedyWalk function
for i = 1:rows
    startingPosition(1) = i;
    [pathRows,pathCols] = GreedyWalk(startingPosition, direction, E);
    
    % Storing a 2D array of pathRows and pathCols
    pathRowsArray(i,:) = pathRows;
    pathColsArray(i,:) = pathCols;
    
    % Calculating the cost of each path and storing it in a 1D array
    % Calculating the elevations for each path and storing it in a 2D array
    [pathElev,cost] = FindPathElevationsAndCost(pathRows,pathCols,E);
    pathElevArray(i,:) = pathElev;
    costArray(i) = cost;
end

% The minimum function only returns the first minimum value so in the event
% of one or more paths tying for the lower cost, the path that starts with
% the lowest row number will be returned.
[~, MinCostPosition]= min(costArray);

% Retrieving the pathRows, pathCols and pathElev from the 2D array
% using the indice of the minimum cost
pathRows = pathRowsArray(MinCostPosition,:);
pathCols = pathColsArray(MinCostPosition,:);
pathElev = pathElevArray(MinCostPosition,:);

end

