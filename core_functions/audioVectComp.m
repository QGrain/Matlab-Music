function [ last_end_index, song_array ] = audioVectComp(song_array, beat_array, beat_time, fs, comp_mode, last_end_index)
    % Pad both array preparing for addition
    target_length = ceil(beat_time*fs);
    len_song_arr = length(song_array);
    len_beat_array = length(beat_array);
    
    % DEBUG
%     plot(song_array);
%     hold on 
%     plot(beat_array);
%     hold off

    padSize = max([len_beat_array+last_end_index len_song_arr last_end_index+target_length]);
    if strcmp(comp_mode, 'add')
        %song_array = padarray(song_array, [1, padSize], 0, 'post');
        song_array = [song_array zeros(1, padSize-len_song_arr)];   % Appended to padSize
        %beat_array = padarray(beat_array, [1, padSize], 0, 'pre');
        beat_array = [zeros(1, last_end_index) beat_array zeros(1, padSize-last_end_index-len_beat_array)]; % Align to last_end_index
    elseif strcmp(comp_mode, 'cut')
        song_array = [song_array(1:padSize-len_beat_array) zeros(1, len_beat_array)];
        beat_array = [zeros(1, last_end_index) beat_array zeros(1, padSize-last_end_index-len_beat_array)];
    else
        disp('Error composing mode!');
    end
    
    % Addition, currently default is "ADD" mode
    power = 1;
    if target_length == 0
        power = 0.4;
        disp(power);
    end
    song_array = song_array + power*beat_array;
    last_end_index = last_end_index + target_length;
end

