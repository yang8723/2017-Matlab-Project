function [TargetNode] = BestPath_CostMatrix(E,UnvisitedArray,TargetNode);
% The BestPath_CostMatrix function creates a cost matrix
% 1st Column = startNode and sourceNodes, 2nd Column = minimum elevation 
% change from the startNode to that node, 3rd column = previous nodes
% Input =  E, elevation data stored in a 2D m x n matrix
% Output = TargetNode, a 1D array of the visited nodes 
% Author = Hyesu Yang 215043376

% sourceNode has to start at 2 as this is the starting node
sourceNode = 1;

% Determining the size of the elevation data, E
[rows,cols] = size(E);

% Assigning all the previous nodes in the third column as infinity
CostMatrix = Inf(rows*cols+2,3);

% Naming the nodes starting from 1 in the first column
CostMatrix(:,1) = 1:rows*cols+2;  

% Starting node does not have a previous node
CostMatrix(1,3) = -1;

% The previous node to the first column is 1
CostMatrix(2:rows+1,3) = 1;

while sourceNode < rows*cols+2
    [UnvisitedArray,sourceNode,CostMatrix] = BestPath_ElevationChange(CostMatrix,sourceNode,E,UnvisitedArray);
end 

count = 1;
while TargetNode>1  
    
    % Creating a 1D array of the target nodes (visited nodes) 
    TargetNode(count) = TargetNode;
    
    % Backtracking to the previous node
    TargetNode = CostMatrix(TargetNode,3);
    
    count = count + 1;   
end

% Reversing the order of the 1D array of TargetNode since we were
% backtracking
TargetNode = Reverse(TargetNode);

end 
