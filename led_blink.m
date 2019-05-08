%% led_blink.m
clear a
a = arduino('COM5', 'Mega2560');

for i = 1:10
    writeDigitalPin(a, 'D11', 0);
    pause(0.5);
    writeDigitalPin(a, 'D11', 1);
    pause(0.5);
end

clear a