function count = liveNeighbors(row, col, world)
% liveNeighbors 
%
% Counts the number of live neighbors of location (row, col) in the  
% given world matrix.  A location in the world matrix is live if it 
% has the value 1.
%
% Input:
%   row     the row index of the location    
%   col     the column index of the location 
%   world   the world matrix representing live and dead cells     
%
% Output: the number of live neighbors for the given location
%    

count = 0;  % initialize count to 0

%=========================================================================
% TO DO: 
%   Add code to check each of the possible locations that are neighbors 
%   of location (row, col).  For example, if C is the cell below, then  
%   count the number of live cells in the positions marked with X's:
%
%       ---------------------
%       |   |   |   |   |   |
%       ---------------------
%       |   | X | X | X |   |
%       ---------------------
%       |   | X | C | X |   |
%       ---------------------
%       |   | X | X | X |   |
%       ---------------------
%       |   |   |   |   |   |
%       ---------------------
%=========================================================================

%%get size of the world
getSize = size(world);
rowN = getSize(1,1);
colN = getSize(1,2);

%%loop through all the neighbours
if inRange(row, col, rowN, colN)
    for x = row-1:row+1
        for y = col-1:col+1
            %%check if the neighbour is in range
            if inRange(x, y, rowN, colN) && ~(x==row && y==col)
                if world(x,y)==1
                    count=count+1;
                end
            end
        end
    end
end