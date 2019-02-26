[harm_coef, envelope, one_sec_index] = instrumentPropertyScan('try.wav');
fs = 40000; 
audio_array = beatGene(envelope, one_sec_index, harm_coef, 98, fs);
sound(audio_array, fs);

% DEBUG


% Plots
figure(1);
subplot(2,1,1); plot(envelope);
subplot(2,1,2); plot(audio_array);
