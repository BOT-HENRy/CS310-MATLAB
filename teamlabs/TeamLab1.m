%% CS 310 Team Lab 1: Engineering Cost Analysis in MATLAB
% SOLUTION - Fall 2015
%
% <<../tvom_formula.gif>>

%% 1.a Numeric Calculations
% 
% $$ F = P(1+a)^n $$
% 
F = 10000*(1+0.04)^5;

% Use disp and num2str to format answer in a more user-friendly way
disp(['You will have $' num2str(F) ' after 5 years if you invest ' ...
      '$10,000 at 4%'])
  
%% 1.b Numeric computations on vectors (and matrices)

disp('Notice how the colon operator is used to create a vector')
a = 0.04 : 0.005 : 0.07

% F = 10000*(1+a)^5;
disp('F = 10000*(1+a)^5 caused error.  Fixed with element-wise operator')
F = 10000*(1+a).^5

%% 2.a Matrix Multiplication
A = [ 1 , 2 ; 3 , 4 ; 5 , 6 ; 7 , 8 ]
B = [  1,  2, 3 ;  4,  5, 6 ]
C = A * B
% D = B * A
disp('B*A did not work because the dimensions are incompatible')

%% 2.b Add a scalar to a matrix
one_plus_a = 1 + a

%% 2.c Matrix operators vs Element-wise operator
x = [ 1 2 3 4 ; 5 6 7 8; 9 10 11 12; 13 14 15 16]

disp('Matrix multiplication of ''squaring'' a matrix')
x2_matrix_algebra_mult = x^2

disp('Element-wise multiplication ''squaring'' a matrix')
x2_elementwise_mult = x.^2

%% 2.d Which operator will square each interest rate in our computation?
% The .^ (dot-power) operator will square each interest rate

%%  3.a Plot the Future Value of Money vs Interest Rate
% 
% $$ F = P(1+a)^n $$
%
FV = 10000*(1+a).^5;
plot(a,FV)

% Add titles and axis labels after the plot command to 
% make your plots more user-friendly
title('Future Value after 5 years vs Interest Rate')
xlabel('Interest Rates')
ylabel('Future value of $10,000 after 5 years')

% Soon, loops will offer a better way to display this user-friendly info.
disp(['Interest rate ' num2str(a(1)) ', 5 yrs, amt = $' num2str(FV(1))])
disp(['Interest rate ' num2str(a(2)) ', 5 yrs, amt = $' num2str(FV(2))])
disp(['Interest rate ' num2str(a(3)) ', 5 yrs, amt = $' num2str(FV(3))])
disp(['Interest rate ' num2str(a(4)) ', 5 yrs, amt = $' num2str(FV(4))])
disp(['Interest rate ' num2str(a(5)) ', 5 yrs, amt = $' num2str(FV(5))])
disp(['Interest rate ' num2str(a(6)) ', 5 yrs, amt = $' num2str(FV(6))])
disp(['Interest rate ' num2str(a(7)) ', 5 yrs, amt = $' num2str(FV(7))])

%% 3.b Investment Option
% Which investment option is better? 
%
% # Invest $2,500 for 3 years at 5.7%, then reinvest for 3 years at 5.3%.
% # Invest $2,500 for 6 years at 5.5%.
format long
FV0pt1_first3years = 2500*(1+0.057)^3
FVOption1 = FV0pt1_first3years*(1+0.053)^3
FVOption2 = 2500*(1+0.055)^6
disp('Investment option 2 is slightly better for the given interest rates.')

%% 4. Publishing to HTML
% Added cell headers, comments, and used disp for results.
%
% Then used Save and Publish to create this web page.

%% 5. Publishing Multiple Plots (a second plot figure)
plot(x(1,:),x2_elementwise_mult(1,:))

%% 6. Displaying Equations in Published HTML
%
% $$ y = \frac{sin(x)}{cos(\frac{\pi}{4})} $$
%
x = 1:0.1:10;
y = sin(x)/cos(pi/4);
plot(x,y)
title('sin(x)/cos(\pi/4) vs x')
xlabel('x')
ylabel('sin(x)/cos(\pi/4)')

%% 7. Displaying Lists in Published HTML
% Below is an example of a bulleted list
% 
% * Name 1
% * Name 2
% * Name 3
%

%% 7.(cont) Numbered list example 
% # Launch MATLAB
% # Create script file
% # Write MATLAB code
% # Run script
% # Save and publish
% # Print or upload as needed 

%% 10. Getting Help
help plot
% doc plot
