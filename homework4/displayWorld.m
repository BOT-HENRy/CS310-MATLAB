function displayWorld(world, gen)
% displayWorld
%
% Displays the given world matrix graphically along with the given 
% generation number.  Live cells are displayed as small stars; dead 
% cells are not displayed. A title indicating the generation number is
% also displayed.
%
% After displaying the world, the function pauses until the user types
% a key on the keyboard.  This allows the user to control how long the 
% display is shown.  The code for pausing should be commented out when
% this function is called as part of a script that is being published.
%
% Note:   The cell in location (row, col) in the world matrix is shown
%         at coordinates (row, col) on the xy-axis.
%
% Input:
%   world  the world matrix, where 1 indicates a live cell and 0 
%          indicates a dead cell
%   gen    the generation number
%
% Output: none, this is a void function
%

xx = [];  % list of x coordinates of the live cells
yy = [];  % list of y coordinates of the live cells
[rows, cols] = size(world);
for r = 1 : rows
    for c = 1 : cols
        if world(r, c)     % if the cell is live
            xx = [xx r];   % add its coordinates
            yy = [yy c];   % to the coordinate lists
        end
    end
end

clf
plot(xx, yy, 'mo')                % plot each live cell as a magenta circle
axis([0 rows+1 0 cols+1])
title(['Generation ' num2str(gen)])  % indicate the generation in the title


disp('Hit any key to continue');     % pause the display until the user 
pause                                % hits a key to continue
% The two lines of code above allow the user to control when the next
% generation is displayed. If you want the game to run without user
% intervention, replace the 'pause' with
%   pause(0.2)
