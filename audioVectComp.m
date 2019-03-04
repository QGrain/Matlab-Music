function [ last_end_index, song_array ] = audioVectComp(song_array, beat_arr, beat_time, fs, comp_mode, last_end_index)
    % Pad both array preparing for addition
    target_length = beat_time*fs;
	padSize = max([length(beat_arr)+last_end_index length(song_array) last_end_index+target_length]);
    song_array = padarray(song_array, [1, padSize], 0, 'post');
    beat_arr = padarray(beat_arr, [1, padSize], 0, 'pre');
    
    % Addition, currently default is "ADD" mode
    song_array = song_array + beat_arr;
    last_end_index = last_end_index + target_length;
end

