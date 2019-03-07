close all;
% clear all;
clc; 

% Variables Declaration
sample_rate = 16000; % Sample Rate 16 kHz 
base_note = 262; % Reference Freq 
x = 0 : 1/sample_rate : 0.2-1/sample_rate; % Set Each Beat to  
scale = [1 3 5 8 10 13 15 17 20 22 25 27]; % The scale 
envelope1 = sin(2.*pi.*2.5.*x); %���ְ��� 
envelope2 = cos(2.*pi.*1.25.*x); 
envelope3 = exp(-20.*x); 
plot(envelope1); 

% Random List 
audio = []; 
for ii = 1:20 %����ɸ�20��� 
notes = scale(randperm(length(scale)))-1; %��randperm()��������������� 
freqs = base_note.* 2.^(notes./12); %���������Ƶ�� 
note_group = []; 
for i = 1:length(freqs) 
y = sin(freqs(i).*2.*pi.*x).*envelope1; %����=���Ҳ�*���� 
note_group = [note_group y ]; 
plot(y); 
end 
audio = [audio note_group]; 
end 

%Ч�� 1: overdrive ==-- 
od_gain = 10; %���� ( >=1 ) 
audio = audio .* od_gain; 
audio(find(audio > 1)) = 1; 
audio(find(audio < -1)) = -1; 

%Ч�� 2: stereo delay ==-- 
d_time = 1; %�ӳ�ʱ��(��λΪ����ʱֵ�ı���) 
delay = zeros(1,length(x).*d_time); 
audio =[ [audio delay];[delay audio] ]'; 

%���� ==-- 
player = audioplayer(audio,sample_rate); 
play(player); 
disp('ֹͣ������ִ��:') 
disp('stop(player)') 