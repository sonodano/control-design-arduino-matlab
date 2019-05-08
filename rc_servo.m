%% rc_servo.m
a = arduino('COM5', 'Mega2560', 'Libraries', 'Servo');

s = servo(a, 'D10'); % pin, D10につながったサーボに接続

% サーボは0-180度まで動かせる
% 本書とは違い、公式サンプル通りに0-180度まで36度ずつ動かす
for angle = 0:0.2:1
    writePosition(s, angle); % 第二引数は0-1の値
    current_pos = readPosition(s);
    current_pos = current_pos*180;
    fprintf('Current motor position is %d degrees\n', current_pos);
    pause(2);
end

clear a s