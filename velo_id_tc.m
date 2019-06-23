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

c1 = mean(y(w_time/ts:s_time/ts));
c2 = mean(y((s_time+w_time)/ts : end));

figure(1)
plot(t, y,...
    t, ones(size(t))*c1, 'r--',...
    t, ones(size(t))*c2, 'r--')
xlabel('Time [s]')
ylabel('Veloity [V]')

%% Calulate Gain
K_id = (c2 - c1) / p_const;
u_offset = (K_id * r_const - c1) / K_id;

%% Calculate time constant
y2 = y(s_time/ts : end) - c1;
t2 = t(s_time/ts : end);
t2 = t2 - t2(1);

tc_idx = find(y2 > (c2 - c1) * 0.632, 1 );
T_id = t2(tc_idx);

figure(2)
plot(t2, y2, '.',...
    T_id, (c2-c1)*0.632, 'ro',...
    t2, ones(size(t2)) * (c2 - c1), 'r--')
xlim([0 w_time])
xlabel('Time [s]'), ylabel('Velocity [V]')

%% Display results
fprintf('== Results ==\n')
fprintf('K = %f\n', K_id)
fprintf('T = %f\n', T_id)
fprintf('u_offset = %f\n', u_offset)
