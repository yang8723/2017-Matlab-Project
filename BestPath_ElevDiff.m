function [elev_differences] = BestPath_ElevDiff(sourceNode,possible_positions,E)
% The BestPath_AdjacentValues function finds adjacent values from the
% source node
% Input = 
% Output = 
% Author = Hyesu Yang 215043376
% Reference = Dijkstra's Algorithm 

[rows,cols] = size(E);

% 1st Column = sourceNode, 2nd Column = elevation change from the startNode
% to the sourceNode, 3rd column = previous node
elev_differences = zeros(rows*cols+2,3);

% From the starting node (=1) to nodes in column 1, elevation difference is
% equal to zero
startNode = 1;
sourceNode = 2:(rows+1);

elev_differences(:,1) = 1:rows*cols;  % Naming the nodes
elev_differences(:,2) = abs(sourceNode - startNode);
elev_differences(:,3) = 


elseif sourceNode == [(rows*cols+1):-1:((rows*cols+1)-(rows))]
    elev_differences = 0;
else
    elev_differences = abs(E(NodeRows,NodeCols) - possible_positions);
end





end

