% clear all;
% clc;

% Get the sample array
[audio, fs] = audioread('pianoC.mp3');
audio = audio(:, 1); % Get only one tunnel


% Get the standarized envelope
[upper_envelope, lower_envelope] = envelope(audio);
avg_envelope = (upper_envelope - lower_envelope);
avg_envelope = avg_envelope / max(avg_envelope);

% figure(1);
% subplot(1, 2, 1); plot(audio);
% subplot(1, 2, 2); plot(avg_envelope);
% 
% disp(size(audio));
% disp(size(avg_envelope));

