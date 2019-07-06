%% sw_count.m
clear a
a = arduino('COM5', 'Mega2560');
pin = 'D12';

count = 0; % counter
state = 0;
while(count < 10)
    din = readDigitalPin(a, pin);
    if (din == 0 && state == 0);
        count = count + 1;
        fprintf('c = %d\n', count);
        state = 1;
    end
    if (din == 1 && state == 1);
        state = 0;
    end
end

clear a 