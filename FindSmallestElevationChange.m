function [smallestPosition] = FindSmallestElevationChange(current_position,possible_positions)
% FindSmallestElevationChange function finds the position in an array of
% elevations of the element or elements that correspond to the smallest
% change in elevation, given the current elevation.
% Input = current_position, A number representing the current elevation
%         possible_positions, A 1D array of new elevations to choose from
% Output = smallestPosition, A 1D array containing a list of indices that
%         identify the array element(s) that correspond to the smallest
%         change in elevation(absolute value)
% Author =  Hyesu Yang 215043376

% Calculating a 1D array of absolute elevation differences
elev_differences = abs(current_position - possible_positions);

% Finding the position of the minimum elevation in the 1D array of
% elevation differences
smallestPosition = find(min(elev_differences) == elev_differences);

end 






