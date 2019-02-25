% clear all;
% clc;

% Get the sample array
[audio, fs] = audioread('pianoC.mp3');
audio = transpose(audio(:, 1)); % Get only one tunnel
sound(audio, fs);
% plot((0:length(audio)-1)/fs, audio);
time_vector = 0: 1/fs: (length(audio)-1)/fs; % Create the time vector


% Get the standarized envelope
[upper_envelope, lower_envelope] = envelope(audio);
avg_envelope = (upper_envelope - lower_envelope);
avg_envelope = avg_envelope / max(avg_envelope);

% Get the frequency domain f igure
Y = fft(audio); % Y are complexes
L = length(audio);
f = fs*(0:(L/2))/L;
P2 = abs(Y/L);  % Modulus of complexes
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);



[peaks, oriLocs] = findpeaks(P1, f, 'MinPeakDistance', 200); % Problem
% Of accuracy!
% peaks = peaks*1000;
sortedPeaks = sortrows(transpose([peaks; oriLocs]), 1, 'descend');
disp(sortedPeaks(:,1));
disp(sortedPeaks(:,2));






% disp(localMaxima);
% disp(size(localMaxima));
% disp(max(localMaxima));
% plot(f, P1);


% plot(f, P1);
% disp(size(result));
% disp(result);

% figure(1);
% subplot(1, 2, 1); plot(audio);
% subplot(1, 2, 2); plot(avg_envelope);
% 
% disp(size(audio));
% disp(size(avg_envelope));

