function [data_path] = generateAudioData_win(source_music_book)
    addpath(genpath(pwd));
    % Fetching environment values
    %config_json = jsondecode(fileread('matlab_music_config.json'));
    
    %fs = config_json.fs; 
    %if ~fs
    %    fs = 44000;
    %end
    fs = 44000;
    %root_path = config_json.project_root;
    %if root_path(end) ~= '\'
    %    root_path = strcat(root_path, '\');
    %end
    root_path = 'C:\Users\zhang\Desktop\github\Matlab-Music\';
    
    instrument = 'piano_standard';
    
    sourcePathComponents = regexp(source_music_book, '\', 'split');
    song_path = strcat(root_path, 'song_data\', sourcePathComponents(end), '.mat');
    
    % Iterate over source_music_book and generate the sound
    % PS: Bare those special circumstances in mind!
    % function [ last_end_index, song_array ] = audioVectComp(song_array, beat_array, beat_time, fs, comp_mode, last_end_index)
    % function beat_array = beatGene(avg_envelope, one_sec_index, harm_coef, key, fs)
    % function [harm_coef, avg_envelope, one_sec_index] = instrumentPropertyScan(filename)
    
    beats_array = parseBook(source_music_book);
    audio_data = [];
    last_end_index = 0;
    for beat_info = beats_array
        [harm_coef, avg_envelope, one_sec_index] = envType2Parameters_win(beat_info.envType, instrument, root_path);
        [ last_end_index, audio_data ] = audioVectComp( ...
            audio_data, ...
            beatGene(avg_envelope, one_sec_index, harm_coef, beat_info.key, fs), ...
            beat_info.time, ...
            fs, ...
            'cut', ...
            last_end_index ...
        );
    end
    
    %sound(audio_data, fs);
    %plot(audio_data);
    song_path = string(song_path);   % Cell to String
    save(song_path, 'audio_data', 'fs');
    sound(audio_data, fs);
    %audiowrite(song_path, audio_data, fs);

    % DEBUG
    DEBUG = 0;
    if DEBUG
        disp(root_path);
    end
end

function [harm_coef, avg_envelope, one_sec_index] = envType2Parameters_win(envType, instrument, root_path)
    % Base paths
    sound_materials_path = strcat(root_path, 'sound_materials\', instrument, '\');
    asset_path = strcat(root_path, 'assets\', instrument, '\');
    % File names
    firstChar = floor(envType/2);
    secondChar = num2str(ceil(envType/2) - firstChar);
    firstChar = num2str(firstChar);
    
    % DEBUG
%     disp('next:');
%     disp(envType);
%     disp(strcat(firstChar, secondChar));
    
    % React accordingly to either circumstances.
    asset_path = strcat(asset_path, firstChar, secondChar, '.mat');
    if exist(asset_path, 'file')
        data = load(asset_path);
        harm_coef = data.harm_coef;
        avg_envelope = data.avg_envelope;
        one_sec_index = data.one_sec_index;
    else
        sound_materials_path = strcat(sound_materials_path, firstChar, secondChar, '.mp3');
        [harm_coef, avg_envelope, one_sec_index] = instrumentPropertyScan(sound_materials_path);
        %[harm_coef, avg_envelope, one_sec_index] = instrumentPropertyScan('C:\Users\zhang\Desktop\github\Matlab-Music\sound_materials\sax\8.wav');
        save(asset_path, 'harm_coef', 'avg_envelope', 'one_sec_index');
    end
    
    % DEBUG
    DEBUG = 0;
    if DEBUG
        plot(avg_envelope);
        disp(harm_coef);
        disp(one_sec_index);
        disp(envType);
    end
end