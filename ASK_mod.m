%% Digital Modulation
clear;
fc = input('enter the carrier signal freqency');
Ac = input('enter the carrier signal amplitude');
 

%% Generating Square wave
dig = randi([0 1],1,20,'double');
n = length(dig);
t=0:0.01:n;
x = 1:1:(n+1)*100;
for i = 1:n
    for j = i:.1:i+1
        Dig(x(i*100:(i+1)*100)) = dig(i);
    end
end
Dig = Dig(100:end);
subplot(3,1,1) 
plot(t,Dig)
grid on;
xlabel('Time')
ylabel('Amplitude')
title('Digital signal Wave')

%% Carrier Wave
car = Ac.*sin(2*pi*fc*t);
subplot(3,1,2) 
plot(t,car)
xlabel('Time')
ylabel('Amplitude')
title('Carrier Signal Wave')

%% ASK Modulation
ask_wave = Dig.*car;
subplot(3,1,3) 
plot(t,ask_wave), xlabel('Time'),ylabel('Amplitude'),title('ASK Wave')

