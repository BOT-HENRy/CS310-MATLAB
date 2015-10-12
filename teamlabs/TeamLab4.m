%% CS 310 Team Lab 4: Data Fitting
% SOLUTION - Fall 2015

%% Problem 1: Simple polynomial fit and interpolation
clear
clf

% part a
xdata = [ 0   10   15   22   31   40];
ydata = [20   32   38.7 47.5 52.1 60.2];

% Interpolate using polynomial:
coefs_i = polyfit(xdata(2:6), ydata(2:6), 4);  % deg 4, all but 1st data pt
coefs_ii = polyfit(xdata(1:5), ydata(1:5), 4); % deg 4, all but last pt
coefs_iii = polyfit(xdata, ydata, 5);          % deg 5, all data pts

% Plot interpolating polynomials and data points
xx = 0 : 0.1 : 45;
yy_i = polyval(coefs_i, xx);
yy_ii = polyval(coefs_ii, xx);
yy_iii = polyval(coefs_iii, xx);

hold on
plot(xdata, ydata, 'bo');  % plot data points a blue circles
plot(xx, yy_i, 'r');       % plot 1st interpolation as red solid line
plot(xx, yy_ii, 'g--');    % plot 2nd interpolation as green dashed line
plot(xx, yy_iii, 'k:');    % plot 3rd interpolation as black dotted line
hold off

% Estimate positions using polynomial of degree 5 & all data points
y_1985_poly = polyval(coefs_iii, 25);
y_1995_poly = polyval(coefs_iii, 35);
disp('Using polynomial of degree 5, estimated position of foot of glacier');
disp(['    in 1985: ', num2str(y_1985_poly)]);
disp(['    in 1995: ', num2str(y_1995_poly)]);

% Estimate positions using spline
y_1985_spline = spline(xdata, ydata, 25);
y_1995_spline = spline(xdata, ydata, 35);
disp('Using cubic spline, estimated position of foot of glacier');
disp(['    in 1985: ', num2str(y_1985_spline)]);
disp(['    in 1995: ', num2str(y_1995_spline)]);

%% Problem 2: Simple exponential fit
clear
clf
hold on

% Data from Table 1
xdata = 0 : 10;
ydata = [12011, 5311, 2696, 1595, 1086, 805, 627, 499, 409, 332, 271];

zdata = log(ydata);               % transform data: z = ln(y)
coefs = polyfit(xdata, zdata, 1); % fit transformed data to line z = A + bx

a = exp(coefs(2));                % coefs = [b, A] and A = ln(a)
b = coefs(1);
disp(['a = ', num2str(a), '  b = ', num2str(b)]);

% Plot data points and approximating function
xx = [0 : 0.1 : 10];
yy = a * exp( b *xx);
plot(xdata, ydata, 'kp', xx, yy, 'b'); 

% Estimate y for x = 5.500
y_est_55 = a * exp(b * 5.5);
disp(['At x = 5.5, y is estimated to be ', num2str(y_est_55)]);

% Use only first 4 data points for the approximation
coefs_4 = polyfit(xdata(1:4), zdata(1:4), 1);
a_4 = exp(coefs_4(2));
b_4 = coefs_4(1);
yy_4 = a_4 * exp(b_4 * xx);
plot(xx, yy_4, 'r--');

hold off

%% Problem 3: Determination of two radioactive decay rates
clear
clf
hold on

% Data from Table 2
time = 0 : 10;
cr = [12011, 5311, 2696, 1595, 1086, 805, 627, 499, 409, 332, 271];

% Plot the data points
plot(time, cr, 'o');  

% Find lambda1 and A1 by fitting data points for time > 6
coefs1 = polyfit(time(8:11), log(cr(8:11)), 1);
lambda1 = coefs1(1);
A1 = exp(coefs1(2));
disp(['lambda1 = ', num2str(lambda1), '   A1 = ', num2str(A1)]);

% Plot material 1
t = 0 : 0.1 : 10;
approx1 = A1 * exp(lambda1 * t);
plot(t, approx1, 'g');

% Subtract to find count rate attributable only to material 2
cr1 = A1 * exp(lambda1 * time);  % count rate for material 1
cr2 = cr - cr1;  

% Find lambda2 and A2 by fitting adjusted data for time <= 6
% (since at time = 7, the adjusted count rate is negative)
coefs2 = polyfit(time(1:7), log(cr2(1:7)), 1);
lambda2 = coefs2(1);
A2 = exp(coefs2(2));
disp(['lambda2 = ', num2str(lambda2), '   A2 = ', num2str(A2)]);

% Plot material 2
approx2 = A2 * exp(lambda2 * t);
plot(t, approx2, 'b');

% Plot the sum of the decay functions
plot(t, approx1 + approx2, 'r');

hold off
