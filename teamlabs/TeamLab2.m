%% CS 310 Team Lab 2: Functions and Plotting in MATLAB
% SOLUTION - Fall 2015

%% 1.a Decimal approximation of sine of pi/3 radians
clear
sin(pi/3)         
disp('Enter the value for pi in MATLAB by typing "pi"');

%% 1.b Exponential of sine of pi/3 radians
% Uses the default variable name "ans" from the previous command
exp(ans)

%% 1.c Compute the exponential of sin(pi/3) for a range of angles

vec = 0 : (pi/3)/100 : pi/3  %   i. create vector ranging from 0 to pi/3
sin_vec = sin(vec)           %  ii. compute sine of previous vector
exp_vec = exp(sin_vec)       % iii. compute exponential of previous result

%% 1.d Understand the use of ( ) to access elements of a vector

val1 = vec(2)           
% val1 contains the second element of the vec vector

val2 = sin_vec(1:5)     
% val2 contains the first through fifth elements of the sin_vec vector

val3 = exp_vec(2:3:20)
% val3 contains elements 2, 5, 8, 11, 14, 17, 20 of the exp_vec vector

%% 1.e Calculate sine and exponential of sine for a new  range of angles
% Suppress the output using the semi-colon (;)
% Suppressing the output allows you to compute and use intermediate values
% while only displaying final result values.

clear
vec = 0 : pi/200 : 2*pi;
sin_vec = sin(vec);
exp_vec = exp(sin_vec);

%% 1.f Plot the sine vs. the angle as red dots.
plot( vec, sin_vec, 'r.' )

%% 1.f Plot the sine vs. the angle as a red line.
plot( vec, sin_vec, 'r-' )

%% 1.f Plot the exponential of sine vs. the angle as a blue dotted line.
plot( vec, exp_vec, 'b:' )

%% 1.f Plot both sine and exponential of sine on sample plot figure
plot( vec, sin_vec, 'r-' , vec, exp_vec, 'b:' )


%% 2.b Define the function exp_of_sin in the file exp_of_sin.m
% See <../exp_of_sin.m exp_of_sin.m>

%% 2.c Try the newly defined function on a scalar
exp_of_sin(pi/3)

%% 2.d Modify the return value to equal [s_val, e_val]
% See <../exp_of_sin2.m exp_of_sin.m>
exp_of_sin2(pi/3)

%% 2.e Modify the return value to equal [s_val; e_val]
% See <../exp_of_sin3.m exp_of_sin.m>
exp_of_sin3(pi/3)

%% 2.f Try the last exp_of_sin function on a scalar
angle = pi/3;
soln = exp_of_sin3(angle)

%% 2.g Try the last exp_of_sin function on a vector
angle = [ 0 : pi/100 : 2*pi ];
soln = exp_of_sin3(angle)

%% 2.h Separate the return value into s_values and e_values
s_values = soln(1, :);
e_values = soln(2, :);

% The notation (1,:) means --> row 1, all columns
% The notation (:,1) means --> all rows, column 1
% The notation ( 2, [1 3:5 10:2:16] ) means row 2, columns 1 3 4 5 10 12 14 16

plot(angle, s_values, 'g', angle, e_values, 'k')
title('sin and exponential of sin for angles 0 to 2\pi')
xlabel('angle (radians)')
ylabel('sin(angle) and exp(sin(angle))')

%% 2.i Define and call exp_sin_2 function
% Define <../exp_of_sin_2.m exp_of_sin_2.m> and call it to get the sine
% and exponential of sine values in two separate variables.
[sineVals, expVals] = exp_of_sin_2(angle)


%% 3.a Define the function calcPercent
% See <../calcPercent.m calcPercent.m>

%% 3.b Try the calcPercent function
clear

% 3.b.1 Try some simple calculations
calcPercent( 0, 0, 0, 0 )     % should get 0
calcPercent( 60, 10, 5, 2 )   % should get 100
calcPercent( 48, [10 9.5 6.8 9.8 10], [5 5 4.5 3.5 3 5], [2 2 2 2 2] )

% 3.b.2 Try a full-scale calculation
exam =  [54, 42, 48];
quiz = [10, 9.5, 10, 10, 7.8, 6.5, 8.5, 7, 10, 9.2, 4.5, 8.75];
homework = [5, 5, 4, 5, 5, 3, 4, 5, 4.5, 4, 4, 5, 5, 4.5, 4];
lab = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2];
grade = calcPercent(exam, quiz, homework, lab);
disp(['The final grade percentage is ', num2str(grade), '%']);

%% 3.c Publish the calcPercent function to HTML
% See <calcPercent.html calcPercent.html>

%% 4.a and 4.b Define DT_reaction_rate and call it on a scalar
% See <../DT_reaction_rate.m DT_reaction_rate.m>
clear
DTrrs = DT_reaction_rate(4)

%% 4.c Call DT_reaction_rate on a vector
T_vals = 1 : 0.1 : 25;
DTrr  = DT_reaction_rate(T_vals);
plot(T_vals, DTrr)
title('Reaction rate vs Temperature')
xlabel('Deuterium and tritium reaction rate')
ylabel('Temp (keV)')

%% 4.d and 4.e Write and try the fusion power function so that it calls DT_reaction_rate
% See <../DT_fusion_power.m DT_fusion_power.m>
DTfp = DT_fusion_power( 2.7e19 , 2.7e19, 4 )

%% 5.a Plot the Fast Fourier Transform function
clf
plot(fft(eye(17))), axis equal, axis off

%% 5.b Epicloid
% See <../cool_plot1.m cool_plot1.m>
clf
cool_plot1(12, 5)

%% 5.c Chebyshev polynomials
% See <../cheby.m cheby.m>
clf
fplot('cheby ', [-1,1], [], [], [], 5)

%% 5.c Chebyshev polynomials
% See <../cheby.m cheby.m>
clf
fplot('cheby ', [-1,1], [], [], [], 35)

%% 5.d One more cool plot
% See <../cool_plot2.m cool_plot2.m>
cool_plot2(20)
