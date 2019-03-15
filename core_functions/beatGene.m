function beat_array = beatGene(avg_envelope, one_sec_index, harm_coef, key, fs)
    % To adapt the envelope
    len = length(avg_envelope);
    newLen = round(len/one_sec_index*fs);
    transformation_indexes = ceil((1:newLen)*one_sec_index/fs);  % Avoid 0 being index.
    avg_envelope = [avg_envelope; avg_envelope(end)];  % Avoid indexes out of range.
    adapted_envelope = transpose(avg_envelope(transformation_indexes));
    
   	% Get some info
    base_vector = zeros([1 newLen]);
    time_vector = (1:newLen)/fs;
    size_harm_coef = size(harm_coef);
    
    % Create the sound.
    for col_index = 1:size_harm_coef(2)
        angle_freq = 2 * pi * key * round(1.1*harm_coef(2, col_index)/harm_coef(2, 1));
        coef = harm_coef(1, col_index);
        phase = harm_coef(3, col_index);
        base_vector = base_vector + coef*sin(angle_freq*time_vector+phase);
    end
    base_vector = base_vector .* adapted_envelope;
%     disp(size(base_vector));
%     disp(size(adapted_envelope));
    beat_array = base_vector;  % Set the return value.
end