%% CS 310 Team Lab 5: Advanced Functions: fzero, integral, and ode45
% SOLUTION - Fall 2015

%% Problem 1: Volume of a Cut Hemisphere
% For function definitions, see 
%
% * <../areaCutHemisphere.m areaCutHemisphere.m>  
% * <../volumeCutHemisphere.m volumeCutHemisphere.m>
% * <../toBeZeroCutHemisphere20.m toBeZeroCutHemisphere20.m>

%% 1.a: Define (and test) areaCutHemisphere()
clear
area_0 = areaCutHemisphere(0);
disp(['areaCutHemisphere(0) = ', num2str(area_0), ...
      '  ( expected result: ', num2str(0.5*pi*9) ' )'])
area_3 = areaCutHemisphere(3);
disp(['areaCutHemisphere(3) = ', num2str(area_3), ...
      '  ( expected result: 0 )'])
  
%% 1.b & 1.c: Compute volume of portions of the hemisphere
vol_entire = integral(@areaCutHemisphere, -3, 3);  % vol of entire hemisphere

% 1.c: Compute volume of half of hemisphere
vol_half = integral(@areaCutHemisphere, -3, 0);   % vol of half the hemisphere

% Since the volume of an entire sphere is (4/3)pi r^3, we can check our
% results. The sphere has radius 3, so the entire sphere has volumen 36pi.
vol_sphere = (4/3)*pi*3^3;
disp(['volume of entire hemisphere = ', num2str(vol_entire), ...
      '  ( expected result: ', num2str(vol_sphere/2), ' )'])
disp(['volume of half hemisphere = ', num2str(vol_half), ...
      '  ( expected result: ', num2str(vol_sphere/4), ' )'])

% Define volumeCutHemisphere() and compare its results to those above
disp(['volumeCutHemisphere(3) = ', num2str(volumeCutHemisphere(3))])
disp(['volumeCutHemisphere(0) = ', num2str(volumeCutHemisphere(0))])
  
%% 1.d: Find value of t so volume of cut-off hemisphere is 20


t_cut_1 = fzero(@toBeZeroCutHemisphere20, 0);       % Option 1
t_cut_2 = fzero(@(x)volumeCutHemisphere(x)-20, 0);  % Option 2
disp(['(Option 1) Cut hemisphere at t = ', num2str(t_cut_1)])
disp(['(Option 2) Cut hemisphere at t = ', num2str(t_cut_2)])

% check result from fzero is correct by plugging into volumeCutHemisphere()
% (since each option gives in the same result, we'll just use the first)
vol_t_cut = volumeCutHemisphere(t_cut_1);
disp(['Volume at cut = ', num2str(vol_t_cut)])


%% Problem 2: Volume of a Solid of Revolution
% For function definitions, see 
%
% * <../areaCutTorus.m areaCutTorus.m>  
% * <../volumeCutTorus.m volumeCutTorus.m>

%% 2.a: Define (and test) areaCutTorus()
clear
area_1 = areaCutTorus(1);
disp(['areaCutHemisphere(1) = ', num2str(area_1), ...
      '  ( expected result: 0 )'])
area_2 = areaCutTorus(2);
disp(['areaCutHemisphere(2) = ', num2str(area_2), ...
      '  ( expected result: ', num2str(8*pi) ' )'])
area_3 = areaCutTorus(3);
disp(['areaCutHemisphere(3) = ', num2str(area_3), ...
      '  ( expected result: 0 )'])

%% 2.b & 2.c: Compute volume portions of torus
vol_2 = integral(@areaCutTorus, 1, 2);
vol_3 = integral(@areaCutTorus, 1, 3);

disp(['volume of torus cut at t = 2 is ', num2str(vol_2)])
disp(['volume of torus cut at t = 3 (i.e., entire torus) is ', ...
      num2str(vol_3), '  ( expected result: ', num2str(4*pi^2), ' )'])
  
% Define volumeCutTorus() and compare its results to those above
disp(['volumeCutTorus(1) = ', num2str(volumeCutTorus(1)) ...
      '  ( expected result: 0 )'])
disp(['volumeCutTorus(2) = ', num2str(volumeCutTorus(2))])
disp(['volumeCutTorus(3) = ', num2str(volumeCutTorus(3))])

%% 2.d: Find where to cut so volume is half of entire volume

% The volume of the entire torus is is 4pi^2 (as stated in the team lab
% write-up)
half_vol = 2*pi^2;  % half the volume of the torus
t_cut = fzero(@(x)volumeCutTorus(x)-half_vol, 2);
disp(['Cut torus at t = ', num2str(t_cut)])

% check result from fzero is correct by plugging into volumeCutTorus()
vol_t_cut = volumeCutTorus(t_cut);
disp(['Volume at cut = ', num2str(vol_t_cut), ' ( expected result = ', ...
     num2str(half_vol), ' )'])


%% Problem 3: Charging an RC Circuit (First-Order ODE problem)
% See also <../circuitODE.m circuitODE.m>

clear
timespan = [0 0.05];
q0 = 0;
[t_soln, q_soln] = ode45(@circuitODE, timespan, q0);
C = 2e-6;
plot(t_soln, q_soln/C)

%% 3.c and 3.d: Questions
% Q: What is the potential across the capacitor at 0.05 seconds?
%
% A: Since the timespan is 0 to 0.05 seconds, the value of q(t) at
% t=0.05 will be the last value in the q_soln vector divided by C.
%
% Q: What is the value of the limit?
%
% A: The limit is 1.5 V (the emf of the battery). We can get this by
% solving the ODE for a longer timespan and seeing what the last value in
% the q_soln vector divided by C.

disp([ 'Potential across capacitor at 0.05 seconds: ', ...
      num2str(q_soln(length(q_soln))/C) ])

timespan = [0 0.2];
[t_soln, q_soln] = ode45(@circuitODE, timespan, q0);
plot(t_soln, q_soln/C)
disp(['At time t = ', num2str(t_soln(length(t_soln))), ', q(t)/C = ', ...
      num2str(q_soln(length(q_soln))/C) ])
