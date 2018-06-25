function [pathElev,cost] = FindPathElevationsAndCost(pathRows,pathCols,E)
% The FindPathElevationsAndCost function takes a specified path and finds
% the elevations encountered while walking along the path and also
% calculates the total cost for transversing that path
% Input = pathRows, A 1D array representing containing the row indices of
%         the path
%         pathCols, A 1D array representing containing the column indices
%         of the path
%         E, elevation data stored in a 2D m x n matrix
% Output = pathElev, A 1D array containing the elevations for the
%          corresponding row and column indices
%          cost, The total cost of transversing the path
% Author = Hyesu Yang 215043376


% Pre-allocating a zero arrays for the variable pathElev and costList
pathElev = zeros(1,length(pathCols));
costList = zeros(1,length(pathCols-1));

% Creating an array of elevations for the path travelled
for i = 1:length(pathCols)
    pathElev(i) = E(pathRows(i),pathCols(i));
end

% Creating an array of the list of costs for the path travelled and
% calculating the total cost
if length(pathCols) == 1
    cost = 0;
else
    for i = 1:(length(pathCols)-1)
        costList(i) = abs(pathElev(i+1) - pathElev(i));
        cost = sum(costList);
    end
end

end

