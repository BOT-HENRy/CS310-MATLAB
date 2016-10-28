%% CS310 Fall 2015 Homework Assignment 4 
% * Name: YOUR NAME HERE 
% * Team Lab: 30_
% * Due Date: Friday, November 20 by 11:59 pm

%% Problem 1: The Game of Life
clear

% Create and display the initial world
world = initializeWorld('world2.txt');
displayWorld(world, 0)  

% Play game of life for 10 generations
world = gameOfLife(world, 10);


%% Problem 2: The Trapezoid Method
clear
% function we wish to integrate
fctn = @(x) x/3 + 4*cos(2*x)./(1+x) + 3;
%a. plot f(x) from x = 0 to x = 30
x=0:0.01:30;
y=fctn(x);
plot(x,y,'k-')

%b
%in file areaTrapezoid.m

%c.
a = [0, 20];
b = [10, 30];

for k = 1 : length(a)  % for each interval
    
    % the next line is used to visually separate the tests
    disp('----------------------------------------')  
    
    % compute (and display) the results from using integral
    areaI = integral(fctn, a(k), b(k));  
    disp(['Area using integral   = ', num2str(areaI, 15)])
    % num2str(value, N) displays value to a maximum of N digits
    
    % test areaTrapezoid for N = 10, 100, and 1000
    for pow = 1 : 3
        
        N = 10^pow;       
        areaT = areaTrapezoid(fctn, N, a(k), b(k));

        disp(['N = ', num2str(N), ', a = ', num2str(a(k)), ...
            ', b = ', num2str(b(k))])
        disp([' Area using trapezoid = ', num2str(areaT, 15)]);
        errorP = abs(areaT-areaI)/areaI*100;
        disp([' The percentage error = ', num2str(errorP),'%']);
    end
end

%d.
%1.What effect does changing the value of N have?
%   When N becomes larger, the result becomes more accurate and the error will become smaller.

%2.Are the results equally good (or equally bad) for both intervals of integration? 
%  What accounts for the differences (if any)?
%   The results are equally good for both intervals of integration. 
%   The first interval has a higher percentage error because as shown in the graph
%   the curve within the first interval changes more rapidly.

%3.Based on how the percentage error changes as N increases in your results from part c, 
%  what is the order of accuracy of the Trapezoid Method? (Make sure to justify/explain your answer.)
%   The order of accuracy is n=2, because when the N becomes 10 times
%   larger, the error becomes 100 times smaller.
