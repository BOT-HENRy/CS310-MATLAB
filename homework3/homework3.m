%% CS310 Fall 2015 Homework Assignment 3
% * Name: Yizhe Qu
% * Team Lab: 304
% * Due Date: Friday, November 6 by 11:59 pm

%% Problem 1: Rolling Dice
%1.a
doneRoll = 0;
countRoll = 0;
while doneRoll == 0
    countRoll = countRoll + 1;
   if randperm(8,1) == randperm(8,1)
       doneRoll = 1;
   end
end
disp(['It takes ', num2str(countRoll),' times to roll two eight-sided dice until both dice have the same number on top.']);
%1.b
numRoll = 0;
xRollData = [];
yRollData = [];
for i = 1:1:3000
    doneRoll2 = 0;
    countRoll2 = 0;
    while doneRoll2 == 0
        countRoll2 = countRoll2 + 1;
        if randperm(8,1) == randperm(8,1)
            doneRoll2 = 1;
            numRoll = numRoll + countRoll2;
            xRollData = [xRollData i];
            yRollData = [yRollData numRoll/i];
        end
    end
end
avgRoll = numRoll / 3000;
disp(['the average number of rolls needed before both dice have the same number on top is ',num2str(avgRoll)])
%1.c
hold on
plot(xRollData,yRollData,'k-')
title('average number of rolls vs the number of trials completed')
xlabel('number of trials completed')
ylabel('average number of rolls')
hold off

%% Problem 2: Image Filters
clear
  
% The menu of choices to display to the user
options = [ 'Menu options:'; ...
            '1) new image '; ...
            '2) original  '; ...
            '3) negative  '; ...
            '4) sharpen   '; ...
            '5) posterize '; ...
            '6) blur      '; ...
            '7) mirror    ';]

% Read in the digital image file lincoln.jpg, set the current image, 
% and display the image
filename = 'lincoln.jpg';
image = imread(filename, 'jpg');
imshow(image)
  
% Repeatedly present the user with the menu of choices, prompt the user for 
% a choice, and perform the desired actions until the user enters 0 to quit
choice = 1;
while choice ~= 0
  
    disp(options)    
    choice = input('Enter choice (or 0 to quit): ');
  
  
%=========================================================================
% TO DO: 
%   Add code to the if-elseif-else statement below to implement options 
%   1, 2, 4, 5, and 6 (and 7 if you are doing the extra credit)  
%=========================================================================
    % Option 0: quit
    if choice == 0
        disp('goodbye')
    % Option 1: prompts the user to enter the name of jpg image file, reads in the file 
    % and makes the image the new current image, and displays the new current image
    elseif choice == 1
        filename = input('Enter the name of jpg image file: ');
        image = imread(filename, 'jpg');
        imshow(image)
    % Option 2: displays the current image in its original (un-filtered) state
    elseif choice == 2
        image = imread(filename, 'jpg');
        imshow(image) 
    % Option 3: apply the negative filter and display the resulting image
    elseif choice == 3
        newimage = negative(image);
        imshow(newimage) 
    % Option 4: apply the sharpen filter and display the resulting image
    elseif choice == 4
        newimage = sharpen(image);
        imshow(newimage)
    % Option 5: apply the posterize filter and display the resulting image
    elseif choice == 5
        newimage = posterize(image);
        imshow(newimage)
    % Option 6: apply the blur filter and display the resulting image
    elseif choice == 6
        newimage = blur(image);
        imshow(newimage)
    % Option 7: apply the mirror filter and display the resulting image
    elseif choice == 7
        newimage = mirror(image);
        imshow(newimage)
    % Anything that is not one of the choices above is considered invalid
    else
        disp('invalid choice')
    end
    
end    
    