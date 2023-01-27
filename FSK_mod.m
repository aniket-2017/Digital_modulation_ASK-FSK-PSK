%% FSK Digital Modulation
clear;
fc = input('enter the carrier signal freqency');
fd = input('enter the shift freqency');
Ac = input('enter the carrier signal amplitude');
 

%% Generating Square wave
dig = randi([0 1],1,20,'double');
n = length(dig);
for i = 1:n
    if (dig(i) == 0)
        b_p(i) = -1;
    else
        b_p(i) = 1;
    end
end
t=0:0.01:n;
x = 1:1:(n+1)*100;
for i = 1:n
    for j = i:.1:i+1
        Dig(x(i*100:(i+1)*100)) = b_p(i);
    end
end
Dig = Dig(100:end);
subplot(4,1,1) 
plot(t,Dig)
grid on;
xlabel('Time')
ylabel('Amplitude')
title('Digital signal Wave')

%% Carrier Wave
w= 2*pi*fc*t;
w0= 2*pi*fd*t;
carl = Ac.*sin(w-w0);
subplot(4,1,2) 
plot(t,carl)
grid on;
xlabel('Time')
ylabel('Amplitude')
title('low freq Carrier Signal Wave')

carh = Ac.*sin(w+w0);
subplot(4,1,3) 
plot(t,carh)
grid on;
xlabel('Time')
ylabel('Amplitude')
title('High freq Carrier Signal Wave')

%% FSK Modulation

fsk_wave = Ac.*sin(w + (Dig).*w0);
subplot(4,1,4) 
plot(t,fsk_wave)
grid on;
xlabel('Time')
ylabel('Amplitude')
title('FSK Wave')

