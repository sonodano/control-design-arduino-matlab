%% rc_servo.m
a = arduino('COM5', 'Mega2560', 'Libraries', 'Servo');

s = servo(a, 'D10'); % pin, D10�ɂȂ������T�[�{�ɐڑ�

% �T�[�{��0-180�x�܂œ�������
% �{���Ƃ͈Ⴂ�A�����T���v���ʂ��0-180�x�܂�36�x��������
for angle = 0:0.2:1
    writePosition(s, angle); % ��������0-1�̒l
    current_pos = readPosition(s);
    current_pos = current_pos*180;
    fprintf('Current motor position is %d degrees\n', current_pos);
    pause(2);
end

clear a s