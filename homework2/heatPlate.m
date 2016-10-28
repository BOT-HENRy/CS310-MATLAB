function plateTemp = heatPlate( TA, TB, TC )
% accepts three temperature values TA, TB, and TC 
% and returns a single matrix result that is a 3x5 matrix of temperatures
%   temperature value for one tile based upon the temperature values of each of its neighboring tiles
%   T1 = (TA + T2 + T6)./3;
%   T2 = (T1 + T3 + T7)./3;
%   T3 = (T2 + T4 + T8)./3;
%   T4 = (T3 + T5 + T9)./3;
%   T5 = (T4 + TB + T10)./3;
%   T6 = (T1 + T7 + T11)./3;
%   T7 = (T2 + T6 + T7 + T12)./4;
%   T8 = (T3 + T7 + T9 + T13)./4;
%   T9 = (T4 + T8 + T10 + T14)./4;
%   T10 = (T5 + T9 + T15)./3;
%   T11 = (T6 + T12)./2;
%   T12 = (T11 + T13 + T7)./3;
%   T13 = (T12 + T14 + T8 + TC)./4;
%   T14 = (T13 + T15 + T9)./3;
%   T15 = (T10 + T14)./2;
plate = zeros(15);
plate(1,[1 2 6]) = [3 -1 -1];
plate(2,[1 2 3 7]) = [-1 3 -1 -1];
plate(3,[2 3 4 8]) = [-1 3 -1 -1];
plate(4,[3 4 5 9]) = [-1 3 -1 -1];
plate(5,[4 5 10]) = [-1 3 -1];
plate(6,[1 6 7 11]) = [-1 3 -1 -1];
plate(7,[2 6 7 8 12]) = [-1 -1 4 -1 -1];
plate(8,[3 7 8 9 13]) = [-1 -1 4 -1 -1];
plate(9,[4 8 9 10 14]) = [-1 -1 4 -1 -1];
plate(10,[5 9 10 15]) = [-1 -1 3 -1];
plate(11,[6 11 12]) = [-1 2 -1];
plate(12,[7 11 12 13]) = [-1 -1 3 -1];
plate(13,[8 12 13 14]) = [-1 -1 4 -1];
plate(14,[9 13 14 15]) = [-1 -1 3 -1];
plate(15,[10 14 15]) = [-1 -1 2];
tmp = [TA 0 0 0 TB 0 0 0 0 0 0 0 TC 0 0]';
result = plate \ tmp;
plateTemp = [result(1:5)'; result(6:10)'; result(11:15)'];

end

