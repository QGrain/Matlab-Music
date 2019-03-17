clear;
clc;

[y, Fs] = audioread('./sound_material/piano/piano_47.mp3');

ylen = length(y);
Nfft = 2^nextpow2(ylen(1)); %matlab 下标从1开始
Y = fft(y, Nfft);
f = Fs/2*linspace(0,1,Nfft/2+1);

[yuper, ylower] = envelope(y);
subplot(2,2,1)
plot(yuper);
title('yuper');
xlabel('freq?');

subplot(2,2,2);
plot(ylower);
title('ylower');
xlabel('freq?');

subplot(2,2,3);
plot (y);
title('raw sound of 47 piano');
xlabel('time(ms)')

subplot(2,2,4);
plot(f, 2*abs(Y(1:Nfft/2+1)));
%plot(f, Y(1:Nfft/2+1));
title('freq after fft');
xlabel('freq(Hz)');
ylabel('|Y(f)|');

sound (y, Fs);