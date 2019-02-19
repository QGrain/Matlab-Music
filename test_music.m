%随机序列音乐! v0.3 
%golden blue, 2010-6-23 
%matlab version: 7.1 
close all;clear all;clc; 

%基本设定 ==-- 
sample_rate = 16000; %采样率 16 kHz 
base_note = 262; %基准音 C 
x = [0:1/sample_rate:0.2-1/sample_rate]; %单个音符的时间 0.2秒 
scale = [1 3 5 8 10 13 15 17 20 22 25 27]; %指定一组音符 (以半音为单位) 
envelope1 = sin(2.*pi.*2.5.*x); %三种包络 
envelope2 = cos(2.*pi.*1.25.*x); 
envelope3 = exp(-20.*x); 
plot(envelope1); 

%生成随机序列音 ==-- 
audio = []; 
for ii = 1:20 %就生成个20组吧 
notes = scale(randperm(length(scale)))-1; %用randperm()将音符组随机排列 
freqs = base_note.* 2.^(notes./12); %计算各音的频率 
note_group = []; 
for i = 1:length(freqs) 
y = sin(freqs(i).*2.*pi.*x).*envelope1; %波形=正弦波*包络 
note_group = [note_group y ]; 
plot(y); 
end 
audio = [audio note_group]; 
end 

%效果 1: overdrive ==-- 
od_gain = 10; %增益 ( >=1 ) 
audio = audio .* od_gain; 
audio(find(audio > 1)) = 1; 
audio(find(audio < -1)) = -1; 

%效果 2: stereo delay ==-- 
d_time = 1; %延迟时间(单位为音符时值的倍数) 
delay = zeros(1,length(x).*d_time); 
audio =[ [audio delay];[delay audio] ]'; 

%播放 ==-- 
player = audioplayer(audio,sample_rate); 
play(player); 
disp('停止播放请执行:') 
disp('stop(player)') 