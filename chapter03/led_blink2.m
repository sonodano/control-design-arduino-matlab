%% led_blink2.m
clear a;
a = arduino('COM5', 'Mega2560');

% PWMのDuty比で模擬する場合
n_iter = 50 % 分割数
brightness_step = (1-0)/n_iter; % 1ステップあたりの変化量, duty比は0～100%

for i = 1:n_iter
  writePWMDutyCycle(a, 'D11', i*brightness_step);
  pause(0.1);
end

for i = 1:n_iter
  writePWMDutyCycle(a, 'D11', 1-i*brightness_step);
  pause(0.1);
end

% PWMの電圧で模擬する場合
brightness_step = (5-0)/n_iter; % 電圧の範囲は0-5V
for i = 1:n_iter
  writePWMVoltage(a, 'D11', i*brightness_step);
  pause(0.1);
end

for i = 1:n_iter
  writePWMVoltage(a, 'D11', 5-i*brightness_step);
  pause(0.1);
end

clear a;
