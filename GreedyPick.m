function [pick] = GreedyPick(startingPosition, direction, E)
% The GreedyPick function chooses which array element to go next, based on
% which adjacent element results in the minimum change in elevation. In the
% event of a tie, it'll pick the northern most element.
% Input = startingPosition, a 2 element 1D array representing the current position, where the
%         first element is the row number of the current position and the second
%         element is the column number
%         direction, An integer representing the direction to head in, with a value of
%         +1 for heading east and -1 for heading west
%         E, The elevation data stored in a 2D m by n matrix (where m is the
%         number of rows and n the number of columns)
% Output = pick, A 2 element 1D array representing the new position that has been
%          picked, where the first element is the row number of the new position and
%          the second element is the column number
% Author = Hyesu Yang 215043376

% Determining the size of the elevation data, E
[rows,cols] = size(E);

% Displays the starting position if starting position is on the very left
% (heading west) or very right (heading east)
if  (startingPosition(2) == cols && direction == 1) || ...
        (startingPosition(2) == 1 && direction == -1)
    pick(1) = startingPosition(1);
    pick(2) = startingPosition(2);
else
    % Stating the current position
    current_position = E(startingPosition(1), startingPosition(2));
    
    % Calculating the possible row number from the starting position
    PossibleRows = [startingPosition(1)-1,startingPosition(1), startingPosition(1)+1];
    
    % Calculating the possible column number from the starting position
    if direction == 1
        PossibleCols = startingPosition(2) + 1;
    elseif direction == -1
        PossibleCols = startingPosition(2) - 1;
    end

    % Restricting the number of possible positions for when PossibleRows goes
    % out of range of the elevation data, E (Top or bottom of elevation
    % data)
    if PossibleRows(1) == 0
        PossibleRows(1) = [];
    elseif PossibleRows(3) > rows
        PossibleRows(3) = [];
    end

    % Calculating the possible positions from the array of PossibleRows and
    % PossibleCols
    possible_positions = E(PossibleRows, PossibleCols);
    
    % Recalling the FindSmallestElevationChange function (Picks the
    % northern most smallestPosition value)
    smallestPosition = FindSmallestElevationChange(current_position,possible_positions);
    smallestPosition = smallestPosition(1);
    
    % When it is on the top of the elevation data (row = 1), the
    % smallestPosition value is one less than the actual value since there
    % are only two possible rows from the starting position
    if  startingPosition(1) == 1
        smallestPosition = smallestPosition + 1;
    end
    
    % Rows of the variable pick is not dependent on direction
    % Determining the row number of the variable pick, depending on the value of smallestPosition
    pick(1) = startingPosition(1) + smallestPosition - 2;
    
    % Determining the column number of the variable pick
    pick(2) = PossibleCols;
    
end

end

