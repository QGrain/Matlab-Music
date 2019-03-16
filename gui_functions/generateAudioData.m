function [data_path] = generateAudioData(source_music_book)
    % 
    %
    
    % Fetching environment values
    config_json = jsondecode(fileread('../matlab_music_config.json'));
    root_path = config_json.project_root;
    if root_path(1) ~= '/'
        root_path = strcat('/', root_path);
    end
    default_sound_path = strcat(root_path, 'sound_materials/piano_standard/');
    
    % Iterate over source_music_book and generate the sound
    % PS: Bare those special circumstances in mind!
    
    % DEBUG
    DEBUG = 1;
    if DEBUG
        disp(root_path);
        disp(default_sound_path);
    end
end



