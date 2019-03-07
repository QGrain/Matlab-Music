function [ last_end_index, song_array ] = audioVectComp(song_array, beat_arr, beat_time, fs, comp_mode, last_end_index)
    % Pad both array preparing for addition
    target_length = beat_time*fs;
    len_song_arr = length(song_array);
    len_beat_arr = length(beat_arr);
    
	padSize = max([len_beat_arr+last_end_index len_song_arr last_end_index+target_length]);
    %song_array = padarray(song_array, [1, padSize], 0, 'post');
    song_array = [song_array zeros(1, padSize-len_song_arr)];
    %beat_arr = padarray(beat_arr, [1, padSize], 0, 'pre');
    beat_arr = [zeros(1, padSize-len_beat_arr) beat_arr];
    
    % Addition, currently default is "ADD" mode
    disp(size(song_array));
    disp(size(beat_arr));
    song_array = song_array + beat_arr;
    last_end_index = last_end_index + target_length;
end

