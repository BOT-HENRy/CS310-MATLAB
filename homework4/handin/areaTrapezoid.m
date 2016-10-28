function area = areaTrapezoid (func, N, a, b)
% func - a function handle for the function being integrated
% N - the number of subintervals
% a - the left (or bottom) limit of integration
% b - the right (or top) limit of integration
%   approximates the area under a curve by dividing the curve up into sections
% and approximating the area under the curve for each section using a trapezoid
h = (b - a)/N;
firstPart = 0.5*func(a);
midPart = 0;
lastPart = 0.5*func(b);
for i=1:(N-1)
    midPart = midPart + func(a + h*i);
end
area = h*(firstPart+midPart+lastPart);
end

