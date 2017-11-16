% cruise_response.m - cruise control response curves
% RMM, 17 Sep 04
%
% Required files: none

aminit;					% initialize paths

%%
%% Cruise controller
%%
%% This is a simple PI cruise controller using the vehicle dynamics that
%% are part of the running example described in chapter 3.  The vehicle
%% dynamics are defined in the function 'cruisedyn', which needs to be
%% in the path.
%% 

% Parameter definitions
m1 = 1000;				% mass of the car, kg
m2 = 2000;				% mass of the car, kg
m3 = 3000;				% mass of the car, kg
a = 2;					% engine lag coefficient	

% Numerically compute the gain and time constant for the vehicle dynamics
vehspd = 25;				% nominal speed, m/s
vehthr = 0.135;				% throttle to hold speed
vehgr = 3;				% gear

vehpole1 = (cruisedyn(vehspd+0.1, vehthr, 3, 0, m1) - ...
  cruisedyn(vehspd-0.1, vehthr, 3, 0, m1) ) / 0.2;
vehgain1 = (cruisedyn(vehspd, vehthr+0.01, 3, 0, m1) - ...
  cruisedyn(vehspd, vehthr-0.01, 3, 0, m1) ) / 0.01;

vehpole2 = (cruisedyn(vehspd+0.1, vehthr, 3, 0, m2) - ...
  cruisedyn(vehspd-0.1, vehthr, 3, 0, m2) ) / 0.2;
vehgain2 = (cruisedyn(vehspd, vehthr+0.01, 3, 0, m2) - ...
  cruisedyn(vehspd, vehthr-0.01, 3, 0, m2) ) / 0.01;

vehpole3 = (cruisedyn(vehspd+0.1, vehthr, 3, 0, m3) - ...
  cruisedyn(vehspd-0.1, vehthr, 3, 0, m3) ) / 0.2;
vehgain3 = (cruisedyn(vehspd, vehthr+0.01, 3, 0, m3) - ...
  cruisedyn(vehspd, vehthr-0.01, 3, 0, m3) ) / 0.01;

% Dynamics
veh1 = tf([vehgain1], [1 -vehpole1]);	% vehicle
veh2 = tf([vehgain2], [1 -vehpole2]);	% vehicle
veh3 = tf([vehgain3], [1 -vehpole3]);	% vehicle
eng = tf(a, [1 a]);			% engine dynamics

% Controller
Ki = 0.02;				% integral gain
Kp = 1;					% proportional gain
ctr = tf([Kp Ki], [1 0.01*Ki/Kp]);	% control: PI w/ LF pole

% Now compute the complete system model (loop transfer function)
cruise1 = ctr*eng*veh1;
cruise2 = ctr*eng*veh2;
cruise3 = ctr*eng*veh3;

% Plot step response for two different masses
sys1 = feedback(cruise1, 1);   [resp1,T] = step(sys1, 20);
sys2 = feedback(cruise2, 1);   [resp2,T] = step(sys2, T);
sys3 = feedback(cruise3, 1);   [resp3,T] = step(sys3, T);

% Now rescale the plot so that we go from 25 to 30 m/s
time = [0; 2.5 + T];
step1 = [25; 25 + 5*resp1];
step2 = [25; 25 + 5*resp2];
step3 = [25; 25 + 5*resp3];

% Plot the results
clf; subplot(321); 

% Plot the main data lines
h = plot(time, step1, 'b-', time, step2, 'b-', time, step3, 'b-');
set(h, 'LineWidth', AM_data_linewidth);

% Plot the reference lines
hold on; 
h = plot([0; 2.5; 2.5; max(time)], [25; 25; 30; 30], 'k-');
set(h, 'LineWidth', AM_ref_linewidth);

% Label the axes
axis([0 10 24 33]);
xlabel('time (sec)');
ylabel('speed (m/s)');

% And reset all of the parameters so that it looks write for the book
set(gca, 'DataAspectRatio', [1 2 1]);
set(gca, 'YTick', [20, 25, 30, 35]);
set(gca, 'XTick', [0:5:20]);

% arcarrow([2.7, 29.8], [3.7, 28.5], 8);
% legh = legend(gca, 'm = 1000 kg', 'm = 2000 kg', 'm = 3000 kg', ...
%   'Location', [0.32, 0.685, 0.1, 0.05]);
% legend(legh, 'boxoff');
% set(legh, 'FontSize', 8);

amprint('cruise-response.eps');

