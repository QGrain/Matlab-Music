% author zzy
close all;clear all;clc;

audio = [];

sample_rate = 40000; % 2*20kz
ref_note = 261.6; % base freq for middle C
beat_num = 120; % 120 beats per minute
beat_len = 60 / beat_num; % length of one beat


t = [0:1/sample_rate:beat_len-1/sample_rate];
envelope1 = exp(-10.*t);
% envelope2 = sin(2*pi.*t);
series = [0 2 4 5 7 9 11 12];

for i = [0 2 4 5 7 9 11 12]
    freq = ref_note * 2^( i/12 );
    y = sin(2*pi*freq*t).*envelope1;
    audio = [audio y];
end

plot(audio);

sound(audio, sample_rate);
