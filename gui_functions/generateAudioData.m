function [data_path] = generateAudioData(source_music_book)
    % Fetching environment values
    config_json = jsondecode(fileread('../matlab_music_config.json'));
    
    fs = config_json.fs; 
    if ~fs
        fs = 44000;
    end
    
    root_path = config_json.project_root;
    if root_path(end) ~= '/'
        root_path = strcat(root_path, '/');
    end
    
    instrument = 'piano_standard';
    
    sourcePathComponents = regexp(source_music_book, '/', 'split');
    song_path = strcat(root_path, 'song_data', sourcePathComponents(end), '.mp3');
    
    % Iterate over source_music_book and generate the sound
    % PS: Bare those special circumstances in mind!
    % function [ last_end_index, song_array ] = audioVectComp(song_array, beat_array, beat_time, fs, comp_mode, last_end_index)
    % function beat_array = beatGene(avg_envelope, one_sec_index, harm_coef, key, fs)
    % function [harm_coef, avg_envelope, one_sec_index] = instrumentPropertyScan(filename)
    
    beats_array = parseBook(source_music_book);
    audio_data = [];
    last_end_index = 0;
    for beat_info = beats_array
        [harm_coef, avg_envelope, one_sec_index] = envType2Parameters(beat_info.envType, instrument, root_path);
        [ last_end_index, audio_data ] = audioVectComp( ...
            audio_array, ...
            beatGene(avg_envelope, one_sec_index, harm_coef, key, fs), ...
            beat_info.time, ...
            'cut', ...
            last_end_index ...
        );
    end
    
    save(song_path, audio_data);
    data_path = song_path;
    % DEBUG
    DEBUG = 1;
    if DEBUG
        disp(root_path);
    end
end

function [harm_coef, avg_envelope, one_sec_index] = envType2Parameters(envType, instrument, root_path)
    % Base paths
    sound_materials_path = strcat(root_path, 'sound_materials/', instrument, '/');
    asset_path = strcat(root_path, 'assets/', instrument, '/');
    % File names
    firstChar = floor(envType/2);
    secondChar = num2str(ceil(envType/2) - firstChar);
    firstChar = num2str(firstChar);
    
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
        % save(asset_path, 'harm_coef', 'avg_envelope', 'one_sec_index');
    end
    
    DEBUG = 1;
    if DEBUG
        disp([[harm_coef, avg_envelope, one_sec_index]])
    end
end
        
        
        
    
    


