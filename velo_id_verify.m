%% velo_id_verify.m

%% set identified parameters
K = 1.023866;
T = 0.420000;
u_offset = 0.182807;
r_const = 1.3; % offset voltage
p_const = 0.5; % step input voltage

%% Open simulink model
open_system('velo_id_verify_sl')
open_system('velo_id_verify_sl')

%% Start experiment
sim('velo_id_verify_sl')

%% Save parameters
save model_data K T u_offset