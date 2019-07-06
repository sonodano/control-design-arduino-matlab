%% velo_pi_mdb.m
%% Initialize & load data
close all
clear all
%load model_data

%% model_data‚ğ“Ç‚İ‚Ş‘ã‚í‚è‚É’¼Úw’è
K = 1.023866;
T = 0.420000;
u_offset = 0.182807;


%% PI design by pole placement
p1 = input('p1 = ');
p2 = p1; % dª‚Ì‚Æ‚«
% p2 = input('p2 = '); % p2‚àw’è‚·‚é‚Æ‚«

Kp = -((p1 + p2) * T + 1) / K;
Ki = p1 * p2 * T / K;

%% Display PI parameters
disp('>>> PI parameters <<<')
fprintf('Kp = %f\n', Kp);
fprintf('Ki = %f\n', Ki);

%% Open simulink model
open_system('velo_pi_mdb_sl');
open_system('velo_pi_mdb_sl/Output');

%% experiment
ts = 1/50;
simOut = sim('velo_pi_mdb_sl');

%% EOF of velo_pi_mdb.m