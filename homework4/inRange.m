function ret_val = inRange(row, col, num_rows, num_cols)
% inRange
%
% Checks if the given row and column are valid indices into a matrix   
% with the given number of rows and columns.
%
% Input:
%   row       the row index to check
%   col       the column index to check
%   num_rows  the number of rows in the matrix
%   num_cols  the number of columns in the matrix
%
% Output: true (1) if (row, col) is a valid index; false (0) otherwise
%
% DO NOT MAKE CHANGES TO THIS FILE!!!  It works correctly.
%

% to be valid we must have: 1 <= row <= # rows and 1 <= col <= # cols
ret_val = row > 0 && row <= num_rows && col > 0 && col <= num_cols;
