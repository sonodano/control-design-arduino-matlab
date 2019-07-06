%% velo_id_gain.m

%% Initialize
clear all
close all

%% Parameters
ts = 1/50;
u_ini = 1.5;

%% Define inpu voltage list
u_ref_list = 1: 0.125: 2.5;

%% Open simulink model
open_system('velo_id_gain_sl')
open_system('velo_id_gain_sl/Output')

%% test
u_ref = 1;
simOut = sim('velo_id_gain_sl');
%% test
t = simOut.yout.time;
y = simOut.yout.signals.values;
figure(1)
plot(t, squeeze(y), t, ones(size(squeeze(y))))


%% Start experiment
y_mean_list = [];
for i=1:length(u_ref_list)
    u_ref = u_ref_list(i);
    simOut = sim('velo_id_gain_sl');
    t = simOut.yout.time; % youtはモデルコンフィギュレーションで指定した名前
    y = squeeze(simOut.yout.signals.values);
    y_mean = mean(y(250:end));
    fprintf('y_mean = %f\n', y_mean);
    y_mean_list(i) = y_mean;
    
    % plot figure
    figure(1)
    plot(t, y, t, ones(size(y))*y_mean, 'r');
    xlabel('Time [s]'), ylabel('Velocity [V]')
    axis([0 10 0 3])
    drawnow
end

%% Plot data
figure(2)
plot(u_ref_list, y_mean_list, 'bo')
xlabel('Input voltage [V]')
ylabel('Velocity [V]')
axis([0 3 0 3])

%% Calculate parameters
while(1)
    disp('Please input Umin and Umax for fit') % 線形近似する範囲の指定
    umin = input('Umin = ');
    umax = input('Umax = ');
    sidx = find(u_ref_list >= umin, 1 );
    eidx = find(u_ref_list < umax, 1, 'last' );
    P = polyfit(u_ref_list(sidx:eidx), y_mean_list(sidx:eidx), 1);
    Pin = 0:3;
    Pout = P(1)*Pin + P(2);
    u_offset = -P(2) / P(1);
    fprintf('*** Moter parameters ***\n')
    fprintf('K = %f\n', P(1));
    fprintf('u_offset = %f\n', u_offset);
    
    figure(2)
    plot(u_ref_list, y_mean_list, 'o',...
        u_ref_list(sidx:eidx), y_mean_list(sidx:eidx),...
        'ro', Pin, Pout, 'r-')
    xlabel('Input voltage [V]')
    ylabel('Velocity [V]')
    axis([0 3 0 3])
    
    sw = input('OK? (1:Quit, 2:Retry) = ');
    switch sw;
        case 1;
            break;
        case 2;
            continue;
    end
end




