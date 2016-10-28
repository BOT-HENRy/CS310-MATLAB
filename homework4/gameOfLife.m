function world = gameOfLife(init_world, N)
% gameOfLife
%
% Simulates the game of life using the given initial world as generation 0.
% The simulation then runs for the given number of generations and the
% world at generation N is returned.
%
% Input:
%   init_world  the initial world matrix (i.e., generation 0)    
%   N           the number of generations for which to run the simulation    
%
% Output: the world at generation N
%    

world = init_world;                % initialize the world
[rows, cols] = size(world);  

% determine each subsequent generation and display it
for gen = 1 : N
    next_gen = zeros(rows, cols);  % initially make everything dead
    
%=========================================================================
% TO DO: 
%   Add code to modify the matrix next_gen so that it  represents the  
%   next generation: go through the current world cell by cell and  
%   determine which cells will be live in the next generation (i.e.,  
%   next_gen) and which will be dead.
%=========================================================================
    
    % after adding code above, next_gen will contain the next generation
    for r=1:rows
        for c=1:cols
            liveNnum = liveNeighbors(r, c, world);
            if (world(r,c)==1)&&(liveNnum==0)
                next_gen(r,c)=0;
            elseif (world(r,c)==1)&&(liveNnum<=2)
                next_gen(r,c)=1;
            elseif (world(r,c)==1)&&(liveNnum>2)
                next_gen(r,c)=0;
            elseif (world(r,c)==0)&&(liveNnum>=2)&&(liveNnum<=4)
                next_gen(r,c)=1;
            else
                next_gen(r,c)=0;
            end
        end
    end
    
    % update the world so it is the next generation
    world = next_gen; 
    
    % display the next generation
    displayWorld(world, gen)       % graphic display of world matrix
end
