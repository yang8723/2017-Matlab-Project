function [UnvisitedArray,sourceNode,CostMatrix] = BestPath_ElevationChange(CostMatrix,sourceNode,E,UnvisitedArray)
% The BestElevArrayath_ElevationChange function calculates the total elevation
% change from the source node to the startNode
% Inputs = E, elevation data
%          possibleNodes, whole positive number starting from 1 that
%          represent which node it is. It represents the possible nodes we
%          can take from the sourceNode
%          sourceNode, whole positive number reprsenting the current node
%          we are at
%          CostMatrix, 2D array (1st Column = startNode and 
%          sourceNodes, 2nd Column = minimum elevation change from the 
%          startNode to that node, 3rd column = previous nodes)
% Output = CostMatrix, 2D array representing (1st Column = startNode and 
%          sourceNodes, 2nd Column = minimum elevation change from the 
%          startNode to that node, 3rd column = previous nodes)
%          sourceNode, whole positive number reprsenting the current node
%          we are at
% Author = Hyesu Yang 215043376

% Determining the size of the elevation data, E
[rows,cols] = size(E);

SideArray = zeros(rows,1);
E = [SideArray,E,SideArray];

% I have assigned my starting Node and the ending node outside the matrix
% so we add two to the number of nodes
% Assigning all the tentative distances (elevation changes) to infinity 
CostMatrix(:,2) = Inf;

% The starting node and the first column has an elevation difference of
% zero from the starting node 1 (cost = 0)
CostMatrix(1:rows+1,2) = 0;

% Calculating the position(row,col) of the sourceNode
[NodePosition] = BestPath_NodeToPosition(sourceNode,E);
NodeRows = NodePosition(1);
NodeCols = NodePosition(2);

% Calculating the positions of the possibleNodes
[possibleNodes] = BestPath_PossibleNodes(sourceNode,E);

% Calculating the elevation differences of the sourceNode and the
% possibleNode and storing it in a 1D array
for j = 1:length(possibleNodes)
    [PosNodePosition] = BestPath_NodeToPosition(possibleNodes(j),E);
    PosNodeRow = PosNodePosition(1);
    PosNodeCol = PosNodePosition(2);
    if PosNodeCol > (cols-2)
        elev_differences = 0;
    elseif PosNodeCol == 2
        elev_differences = 0;
    else
        elev_differences(j)= abs(E(PosNodeRow,PosNodeCol)-E(NodeRows,NodeCols));
    end 
end

for i = 1:length(elev_differences)
    % The elevation difference is replaced if it is lower than the current
    % value in the ElevArray
    if elev_differences(i) < CostMatrix(i,2)
       
        % Calculating the total elev difference from our current position 
        % to the starting node
       CostMatrix(i,2) = elev_differences(i) + ElevArray(NodePosition);
       
       % Listing the previous node in the third column of my cost matrix
       CostMatrix(i,3) = NodePosition;
    end
end

% Creating a temporary cost matrix of elevation changes 
TempCostMatrix = CostMatrix(:,2);

% We are only looking at the unvisited nodes
TempCostMatrix = TempCostMatrix(UnvisitedArray);

% Finding the position of the minimum elevation change in my temporary cost
% matrix
[MinRowTempElev,MinColTempElev] = find(min(TempCostMatrix) == TempCostMatrix);

% Getting rid of the visited node in our unvisited array
UnvisitedArray(MinColTempElev) = [];

% Starting at the first row, first column (The node on the outside left of
% the elevation data matrix is equal to one)
sourceNode = CostMatrix(MinRowTempElev,1);
end