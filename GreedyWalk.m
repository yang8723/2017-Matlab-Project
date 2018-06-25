function [pathRows,pathCols] = GreedyWalk(startingPosition, direction, E)
% The GreedyWalk function finds a greedy path from a specified start
% position heading in a specified direction (west or east) and continue
% walking untilt the eastern or westerm edge is reached.
% Input = startingPosition, A 2 element 1D array representing the starting
%         position for the walk, with the first element representing the
%         row number and the second the column number
%         direction, An integer representing the direction to head in, with
%         a value of +1 for heading east and -1 for heading west
%         E, elevation data stored in a 2D m x n matrix
% Output = pathRows, 1D array representing containing the row indices of the
%          path
%          pathCols, 1D array representing containing the column indices of
%          the path
% Author = Hyesu Yang, 215043376

% Determining the size of the elevation data, E
[~,cols] = size(E);

% Calculating the distance from the starting position to the left or right
% end of the array
if direction == 1
    distance = cols - startingPosition(2) + 1;
elseif direction == -1
    distance = startingPosition(2);
end

% Pre-allocating a zeros array for the variables pathRows and pathCols
pathRows = zeros(1,distance);
pathCols = zeros(1,distance);

% Creating an array of pathRows and pathCols and re-allocating the starting
% position each time by recalling the GreedyPick function
for i = 1:distance
    pathRows(i) = startingPosition(1);
    pathCols(i) = startingPosition(2);
    pick = GreedyPick(startingPosition, direction, E);
    startingPosition = pick;
end
end 

