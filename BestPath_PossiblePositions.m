function [possible_positions] = BestPath_PossiblePositions(sourceNode,E)
% The BestPath_PossiblePositions array gets the single value sourceNode and
% converts it to a coordinate on the elevation data,E
% possible_positions = 1D array
% sourceNode = integer (starts from 1) 

[rows,~] = size(E);

division = (sourceNode-1)/rows;

if division == floor(division)  % When it is on the very bottom of the elevation data
    NodeCols = floor(division);     % To prevent cols from having a one higher value
else
    NodeCols = floor(division) + 1;   % Calculates the whole number answer of the division
end

% Calculates the row number for the source node
NodeRows = (sourceNode-1) - rows; % Calculates the remainder of the division

% Calculates the coordinate of the possible positions from the sourcenode
possible_positions = [Noderows,NodeCols];

end

