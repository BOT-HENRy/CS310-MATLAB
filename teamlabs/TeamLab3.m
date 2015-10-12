%% CS 310 Team Lab 3: Linear Systems: So a Bug Walks Onto a Bar ...
% SOLUTION - Fall 2015

%% Problem 1.a: For each position, write the linear equation
%
% $$T_1 = 0$$
%
% $$T_2 = \frac{T_1 + T_3}{2} + 1$$
%
% $$T_3 = \frac{T_2 + T_4}{2} + 1$$
%
% $$T_4 = \frac{T_3 + T_5}{2} + 1$$
%
% $$T_5 = \frac{T_4 + T_6}{2} + 1$$
%
% $$T_6 = \frac{T_5 + T_7}{2} + 1$$
%
% $$T_7 = \frac{T_6 + T_8}{2} + 1$$
%
% $$T_8 = \frac{T_7 + T_9}{2} + 1$$
%
% $$ T_9 = \frac{T_8 + T_{10}}{2} + 1$$
%
% $$T_{10} = \frac{T_9 + T_{11}}{2} + 1$$
%
% $$T_{11} = 0$$

%% Problem 1.b: Reorder the equations in general form
%
% $$T_1 + 0T_2 + 0T_3 + 0T_4 + 0T_5 + 0T_6 + 0T_7 + 0T_8 + 0T_9 + 0T_{10} + 0T_{11} = 0$$
%
% $$- \frac{T_1}{2} + T_2 - \frac{T_3}{2} + 0T_4 + 0T_5 + 0T_6 + 0T_7 + 0T_8 + 0T_9 + 0T_{10} + 0T_{11} = 1$$
%
% $$0T_1 - \frac{T_2}{2} + T_3 - \frac{T_4}{2} + 0T_5 + 0T_6 + 0T_7 + 0T_8 + 0T_9 + 0T_{10} + 0T_{11} = 1$$
%
% $$0 T_1 + 0 T_2 -\frac{T_3}{2} + T_4 - \frac{T_5}{2} + 0T_6 + 0T_7 + 0T_8 + 0T_9 + 0T_{10} + 0T_{11} = 1 $$
%
% $$0T_1 + 0T_2 + 0T_3 - \frac{T_4}{2} + T_5 - \frac{T_6}{2} + 0T_7 + 0T_8 + 0T_9 + 0T_10 + 0T_11 = 1$$
%
% $$0T_1 + 0T_2 + 0T_3 + 0T_4 - \frac{T_5}{2} +T_6 - \frac{T_7}{2} + 0T_8 + 0T_9 + 0T_{10} + 0T_{11} = 1$$
%
% $$0T_1 + 0T_2 + 0T_3 + 0T_4 + 0T_5 - \frac{T_6}{2} +T_7 - \frac{T_8}{2} + 0T_9 + 0T_{10} + 0T_{11} = 1$$
%
% $$0T_1 + 0T_2 + 0T_3 + 0T_4 + 0T_5 + 0T_6 - \frac{T_7}{2} + T_8 - \frac{T_9}{2} + 0T_{10} + 0T_{11} = 1$$
%
% $$0T_1 + 0T_2 + 0T_3 + 0T_4 + 0T_5 + 0T_6 + 0T_7 - \frac{T_8}{2} + T_9 - \frac{T_{10}}{2} + 0T_{11} = 1$$
%
% $$0T_1 + 0T_2 + 0T_3 + 0T_4 + 0T_5 + 0T_6 + 0T_7 + 0T_8 - \frac{T_9}{2} + T_{10} - \frac{T_{11}}{2} = 1$$
%
% $$0T_1 + 0T_2 + 0T_3 + 0T_4 + 0T_5 + 0T_6 + 0T_7 + 0T_8 + 0T_9 + 0T_{10} + T_{11} = 0$$
%

%% Problem 1.c: Rewrite as a single matrix equation
%
% $$ \left[ \begin {array} {ccccccccccccccc}
%  1   &  0   &  0   &  0   &  0   &  0   &  0   &  0   &  0   &  0   &  0\\\noalign{\medskip}
% -0.5 &  1   & -0.5 &  0   &  0   &  0   &  0   &  0   &  0   &  0   &  0\\\noalign{\medskip}
%  0   & -0.5 &  1   & -0.5 &  0   &  0   &  0   &  0   &  0   &  0   &  0\\\noalign{\medskip}
%  0   &  0   & -0.5 &  1   & -0.5 &  0   &  0   &  0   &  0   &  0   &  0\\\noalign{\medskip}
%  0   &  0   &  0   & -0.5 &  1   & -0.5 &  0   &  0   &  0   &  0   &  0\\\noalign{\medskip}
%  0   &  0   &  0   &  0   & -0.5 &  1   & -0.5 &  0   &  0   &  0   &  0\\\noalign{\medskip}
%  0   &  0   &  0   &  0   &  0   & -0.5 &  1   & -0.5 &  0   &  0   &  0\\\noalign{\medskip}
%  0   &  0   &  0   &  0   &  0   &  0   & -0.5 &  1   & -0.5 &  0   &  0\\\noalign{\medskip}
%  0   &  0   &  0   &  0   &  0   &  0   &  0   & -0.5 &  1   & -0.5 &  0\\\noalign{\medskip}
%  \end {array} \right] $$
% 
% These two rows should be rows 10 and 11 in the coefficient matrix above:
% But, MATLAB can not publish the matrix if I include them. This is a 
% documented bug in MATLAB, but no timeline for a fix has been given.
% 
% $$ \left[ \begin {array} {ccccccccccccccc}
%  0   &  0   &  0   &  0   &  0   &  0   &  0   &  0   & -0.5 &  1   & -0.5\\\noalign{\medskip}
%  0   &  0   &  0   &  0   &  0   &  0   &  0   &  0   &  0   &  0   &  1\\\noalign{\medskip}
% \end {array} \right] $$
%
% $$\times \left[ \begin {array}{ccccccccccc} 
% T1\\\noalign{\medskip}
% T2\\\noalign{\medskip}
% T3\\\noalign{\medskip}
% T4\\\noalign{\medskip}
% T5\\\noalign{\medskip}
% T6\\\noalign{\medskip}
% T7\\\noalign{\medskip}
% T8\\\noalign{\medskip}
% T9\\\noalign{\medskip}
% T10\\\noalign{\medskip}
% T11\end {array} \right] = \left[ \begin {array}{ccccccccccc} 
% 0\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 1\\\noalign{\medskip}
% 0\end {array} \right]$$
% 

%% Problem 1.d-f: Enter the coefficient matrix,A, and data vector,b 
% Then solve for the unknowns, T
clear
A = eye(11);                   % put 1 along the diagonal
A( 2, [1  3]) = -0.5;          % fix the spots that need to be -0.5
A( 3, [2  4]) = -0.5;
A( 4, [3  5]) = -0.5;
A( 5, [4  6]) = -0.5;
A( 6, [5  7]) = -0.5;
A( 7, [6  8]) = -0.5;
A( 8, [7  9]) = -0.5;
A( 9, [8  10]) = -0.5;
A(10, [9  11]) = -0.5          % display A (not suppressed)

b = ones(11, 1);
b(1) = 0;
b(11) = 0                      % display b (not suppressed)

T = A\b


%% Problem 2: Modify the previous system to account for a hole
% The hole is the fourth spot on the bar, so it is at position 5.
A(5, [4 6]) = 0
b(5) = 0
T = A\b


%% Problem 3.a: Linear Equations for Bug on a Plate problem
% The positions are numbered 1-25 from left to right, top to bottom.
% Numbering positions so that you can take advantage of any patterns
% is very useful.
%
% $$T_1 = 0$$ $$T_2 = 0$$ $$T_3 = 0$$ $$T_4 = 0$$ $$T_5 = 0$$
%
% $$T_{6} = 0$$
% 
% $$T_{7}  = \frac{T_2 + T_6 + T_8 + T_{12}}{4} + 1$$
% 
% $$T_{8}  = \frac{T_2 + T_6 + T_8 + T_{12}}{4} + 1$$
% 
% $$T_{9}  = \frac{T_2 + T_6 + T_8 + T_{12}}{4} + 1$$
% 
% $$T_{10} = 0$$
%
% $$T_{11} = 0$$ 
% 
% $$T_{12} = \frac{T_{7} + T_{11} + T_{13} + T_{17}}{4} + 1$$
% 
% $$T_{13} = \frac{T_{8} + T_{12} + T_{14} + T_{18}}{4} + 1$$
% 
% $$T_{14} = \frac{T_{9} + T_{13} + T_{15} + T_{19}}{4} + 1$$
% 
% $$T_{15} = 0$$
%
% $$T_{16} = 0$$ 
% 
% $$T_{17} = \frac{T_{12} + T_{16} + T_{18} + T_{22}}{4} + 1$$
% 
% $$T_{18} = \frac{T_{13} + T_{17} + T_{19} + T_{23}}{4} + 1$$
% 
% $$T_{19} = \frac{T_{14} + T_{18} + T_{20} + T_{24}}{4} + 1$$
% 
% $$T_{20} = 0$$
%
% $$T_{21} = 0$$ $$T_{22} = 0$$ $$T_{23} = 0$$ $$T_{24} = 0$$ $$T_{25} = 0$$

%% Problem 3.b-c: Enter the coefficient matrix and data vector for the plate problem
clear
A = eye(25);

A(7, [2 6 8 12]) = -1/4;
A(8, [3 7 9 13]) = -1/4;
A(9, [4 8 10 14]) = -1/4;

A(12, [7 11 13 17]) = -1/4;
A(13, [8 12 14 18]) = -1/4;
A(14, [9 13 15 19]) = -1/4;

A(17, [12 16 18 22]) = -1/4;
A(18, [13 17 19 23]) = -1/4;
A(19, [14 18 20 24]) = -1/4        % display A (not suppressed)

b = zeros(25,1);
b([7:9 12:14 17:19]) = 1           % display b (not suppressed)

%% Problem 3.d-e: Solve the linear system for all 25 positions on the plate.
T = A\b

% Show the results in the form of the plate
plate = [ T(1:5)'; T(6:10)'; T(11:15)'; T(16:20)'; T(21:25)' ]


%% Problem 4: Modify linear system from problem 3 to account for holes 
% The holes are at positions 9 and 13
A(9,[4 8 10 14]) = 0;
A(13,[8 12 14 18]) = 0

b(9) = 0;
b(13) = 0

T = A\b

plate = [ T(1:5)'; T(6:10)'; T(11:15)'; T(16:20)'; T(21:25)' ] 
