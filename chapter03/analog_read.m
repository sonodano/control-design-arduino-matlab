%% a_read.m
a = arduino('COM5', 'Mega2560');
tic
% �Q�Ɠd����ύX����֐����Ȃ�
while (toc<10)
    ain = readVoltage(a, 'A0');
    fprintf('Voltage = %f\n', ain);
    pause(0.5);
end

clear a