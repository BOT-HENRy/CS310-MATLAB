%% CS310 Fall 2015 Homework Assignment 1 
% * Name: Yizhe Qu
% * Team Lab: 304
% * Due Date: Thursday, October 1 by 4 pm


%% Statement of Integrity
% Don't forget to read, sign, and hand in the Statement of Integrity


%% Problem 1.a: Writing MATLAB commands
% Write exactly one line of code to create each of the following vectors. 
clear

% 1. a1 = 4 4 4 4 4 4 4 4 4
a1 = 4 * ones(1,9)
% 2. a2 = 1.0000 0.5000 0.3333 0.2500 0.2000
a2 = [1./(1:1:5)]
% 3. a3 = 2 5 8 11 14 17 14 12 10 8 6 4
a3 = [2:3:17 14:-2:4]
% 4. a4 = 0 0 0 0 0 0 0 3
a4 = [zeros(1,7) 3]
% 5. A 5 x 10 matrix named a5 containing 0's, 2's, and 5's as shown in the write-up.
a5 = [2 .* eye(5); 5 .* ones(5)]'

%% Problem 1.b: Writing MATLAB commands
% Use MATLAB's matrix element access syntax to complete each of the 
% following actions:
clear
data = [ 2 7 4 3; 3 4 7 6; 8 3 5 1; 1 4 2 6; 7 2 2 5 ];

% 1. assign the transpose of the second row to b1
b1 = data(2,[1 2 3 4])'
% 2. assign the first 3 columns to b2
b2 = data([1 2 3 4 5],[1 2 3])
% 3. assign the second and fourth values of the first and third row to b3
b3 = data([1 3],[2 4])
% 4. change data so that its first and fourth columns have been switched
data = data([1 2 3 4 5],[4 2 3 1])

%% Problem 2: Creating a tax table
% Create and display a matrix with four columns:
%
% * column 1 contains amounts from $100 to $1000 in increments of $50
% * column 2 contains the state sales tax due in Arizona
% * column 3 contains the state sales tax due in Nevada
% * column 4 contains state sales tax due in California
clear
format bank  % this will format money values nicely
bank = [100:50:1000; 0.056 .* (100:50:1000); 0.0685 .* (100:50:1000); 0.075 .* (100:50:1000)]'

%% Problem 3: Plotting
% Plot a circle with center (2, 4) and radius 3 along with the data points 
% (2, 7), (4, 3), and (5, 6) on a single figure.
clear
format short  % this will change the format back to the default format

%plot the given circle
angle = 0: 0.01: 2 * pi; 
xPos=3 * cos(angle);
yPos=3 * sin(angle);
plot(2 + xPos,4 + yPos,'b')
hold on
%plot the given points
cX=[2,4,5];
cY=[7,3,6];
plot(cX,cY,'rs')
axis([-3 7 -1 9])
axis equal
%add title and axis labels
title('Circle with center (2, 4) and radius 3 along with the data points')
xlabel('x axis')
ylabel('y axis')
hold off

%% Problem 4: Defining a function
% Part a. Define a function named insideCircle that takes 3 arguments as 
% input: a point, the center of the circle, and the radius of the circle.
% The function returns 1 if the point is inside the circle, 0 if the point 
% is on the circle, and -1 if the point is outside the circle.
%
% Don't forget to attach your insideCircle.m function definition file
%
% Part b. Demonstrate that your function works by adding code to call the
% function using a circle with center (2, 4) and radius 3 and the data 
% points (2, 7), (4, 3), and (5, 6) and display the results.

%part a:
%function defined in file insideCircle.m

%part b:

%for a circle with center (2, 4) and radius 3
%determine if point (2, 7) is inside the circle
result1 = insideCircle([2,7],[2,4],3)
%determine if point (4, 3) is inside the circle
result2 = insideCircle([4,3],[2,4],3)
%determine if point (5, 6) is inside the circle
result3 = insideCircle([5,6],[2,4],3)
