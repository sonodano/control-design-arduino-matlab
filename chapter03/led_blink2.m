%% led_blink2.m
clear a;
a = arduino('COM5', 'Mega2560');

% PWM��Duty��Ŗ͋[����ꍇ
n_iter = 50 % ������
brightness_step = (1-0)/n_iter; % 1�X�e�b�v������̕ω���, duty���0�`100%

for i = 1:n_iter
  writePWMDutyCycle(a, 'D11', i*brightness_step);
  pause(0.1);
end

for i = 1:n_iter
  writePWMDutyCycle(a, 'D11', 1-i*brightness_step);
  pause(0.1);
end

% PWM�̓d���Ŗ͋[����ꍇ
brightness_step = (5-0)/n_iter; % �d���͈̔͂�0-5V
for i = 1:n_iter
  writePWMVoltage(a, 'D11', i*brightness_step);
  pause(0.1);
end

for i = 1:n_iter
  writePWMVoltage(a, 'D11', 5-i*brightness_step);
  pause(0.1);
end

clear a;
