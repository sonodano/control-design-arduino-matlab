%% a_read.m
a = arduino('COM5', 'Mega2560');
tic
% 参照電圧を変更する関数がない
while (toc<10)
    ain = readVoltage(a, 'A0');
    fprintf('Voltage = %f\n', ain);
    pause(0.5);
end

clear a