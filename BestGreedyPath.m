function [pathRows,pathCols,pathElev] = BestGreedyPath(E)
% The BestGreedyPath function will find the best greedy path by calculating
% greedy paths from every single element in the elevation array
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

% Pre-allocating a zeros array
EastCost = zeros(rows,cols);
WestCost = zeros(rows,cols);

for i = 1:rows
    for j = 1:cols
        
        % Calculating the cost when heading east in a 2D array by recalling
        % the GreedyWalk and FindPathElevationsAndCost functions
        [pathRows,pathCols] = GreedyWalk([i j], 1, E);
        [~,cost] = FindPathElevationsAndCost(pathRows,pathCols,E);
        EastCost(i,j) = cost;
        
        % Calculating the cost when heading west in a 2D array by recalling
        % the GreedyWalk and FindPathElevationsAndCost functions
        [pathRows,pathCols] = GreedyWalk([i j], -1, E);
        [~,cost] = FindPathElevationsAndCost(pathRows,pathCols,E);
        WestCost(i,j) = cost;
    end
end

% Adds the 2D array of EastCost and WestCost together
TotalCost = EastCost + WestCost;

% Calculates the minimum cost in each column in the 2D TotalCost array
MinCostCol = min(TotalCost);

% Calculates the one minimum cost value in the 1D array of MinCostCol
MinCost = min(MinCostCol);

% Finding the position (row and column) of the minimum cost in the 2D array
% of TotalCost
[MinRow,MinCol] = find(MinCost == TotalCost, 1 );

% Calculating pathRows,pathCols and pathElev when startingPosition is on
% the westerly edge
if MinCol == 1
    [pathRows,pathCols] = GreedyWalk([MinRow,MinCol], 1, E);
    [pathElev,~] = FindPathElevationsAndCost(pathRows,pathCols,E);
    
    % Calculating pathRows,pathCols and pathElev when startingPosition is on
    % the easterly edge
elseif MinCol == cols
    [pathRows,pathCols] = GreedyWalk([MinRow MinCol], 1, E);
    [pathElev,~] = FindPathElevationsAndCost(pathRows,pathCols,E);
    
    pathRows = Reverse(pathRows);
    pathCols = Reverse(pathCols);
    pathElev = Reverse(pathElev);
else
    % Calculating the pathRows,pathCols and pathElev for the newly allocated
    % startingPosition heading in the east direction
    [EastPathRows,EastPathCols] = GreedyWalk([MinRow MinCol], 1, E);
    [EastPathElev,~] = FindPathElevationsAndCost(EastPathRows,EastPathCols,E);
    
    % Calculating the pathRows,pathCols and pathElev for the newly allocated
    % startingPosition heading in the west direction
    [WestPathRows,WestPathCols] = GreedyWalk([MinRow MinCol], -1, E);
    [WestPathElev,~] = FindPathElevationsAndCost(WestPathRows,WestPathCols,E);
    
    % The first value in the WestPathRows,WestPathCols and WestPathElev is
    % not required as this value is repeated in EastPathRows,EastPathCols
    % and EastPathElev
    WestPathRows(1) = [];
    WestPathCols(1) = [];
    WestPathElev(1) = [];
    
    pathRows = [Reverse(WestPathRows),EastPathRows];
    pathCols = [Reverse(WestPathCols),EastPathCols];
    pathElev = [Reverse(WestPathElev),EastPathElev];
end


