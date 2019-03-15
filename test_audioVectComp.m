song_book = [1 1 5 5 6 6 5 4 4 3 3 2 2 1 5 5 4 4 3 3 2 5 5 4 4 3 3 2 1 1 5 5 6 6 5 4 4 3 3 2 2 1];
freq_array = [1046 1174 1318 1396 1568 1760];

[harm_coef, avg_envelope, one_sec_index] = instrumentPropertyScan('pianoC.mp3');
fs = 44000;
beat_time = 0.3;
song_array = [];
last_end_index = 0;
for note = song_book
    beat_array = beatGene(avg_envelope, one_sec_index, harm_coef, freq_array(note), fs);
    [last_end_index, song_array] = audioVectComp(song_array, beat_array, beat_time, fs, 'CUT', last_end_index);
end

sound(song_array, fs);
% audiowrite('test.wav', song_array, fs);

    
    
    % function [harm_coef, avg_envelope, one_sec_index] = instrumentPropertyScan(filename)