function world = initializeWorld(filename)
% initializeWorld
%
% Loads the file with the given name and uses it to create a world of
% the appropriate size with live cells in the locations indicated.
%
% The size of the world is given in the first line of the file. The
% remaining lines of the file contain the locations of the live cells.
%
% Input:
%   filename   name of the file containing the information used to 
%              initialize the world    
%
% Output: the initialized world    
%    

%=========================================================================
% TO DO: 
%   Replace ALL the code below with your code to load and process the 
%   data file.
%=========================================================================

% create a new (empty) world
worldSize = load(filename);
rows = worldSize(1,1);
cols = worldSize(1,2);
fileSize = size(worldSize);

world = zeros(rows, cols);

% add the live cells
for i=2:fileSize(1,1)
    if inRange(worldSize(i,1), worldSize(i,2), rows, cols)
        world(worldSize(i,1),worldSize(i,2))=1;
    end
end

