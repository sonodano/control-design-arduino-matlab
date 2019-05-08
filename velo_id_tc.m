%% velo_id_tc
%% Initialize
clear all
close all

%% Parameters
ts = 1/50;
u_ini = 1.5; % initial input
r_const = 1.3; % offset voltage
p_const = 0.5; % step input voltage
s_time = 10; %step sime
w_time = 4; % wait time

%% Open simulink model
open_system('velo_id_tc_sl');
open_system('velo_id_tc_sl/Output');

%% Start experiment
simOut = sim('velo_id_tc_sl');

%% Parameter identification
y = squeeze(simOut.yout.signals.values);
t = simOut.yout.time;
