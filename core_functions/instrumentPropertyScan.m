function [harm_coef, avg_envelope, one_sec_index] = instrumentPropertyScan(filename)
    % Configuration
    firstKHarmonics = 5;

    % Get the sample array and sampling frequency.
    [audio, one_sec_index] = audioread(filename);
    audio = audio(:,1); % Get data of only one tunnel
    
    [upper_envelope, lower_envelope] = envelope(audio, 100, 'rms');

    avg_envelope = upper_envelope;
    avg_envelope = avg_envelope / max(avg_envelope); % Standarization
    plot(avg_envelope);
    
    % Fourier Transformation
    fs = one_sec_index;
    Y = fft(audio); % Y are complexes
    L = length(audio);
    f = fs*(0:(L/2))/L;
    P2 = abs(Y)/L;  % Modulus of complexes
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    % Find the optimal distance
    [maxValue, index] = max(P1);
	dist = f(ceil(index*0.9));
    
    % DEBUG
    plot(f, P1);
    
    % Find the possible harmonics
    [peaks, oriLocs] = findpeaks(P1, f, 'MinPeakDistance', dist);
    
    % Transpose
    size_peaks = size(peaks);
    if size_peaks(1) == 1
        peaks = transpose(peaks);
    end
    size_oriLocs = size(oriLocs);
    if size_oriLocs(1) == 1
        oriLocs = transpose(oriLocs);
    end

    % Get the harmonics
    peaks = peaks/maxValue;   % Standarization
    toSortPeaks = horzcat(peaks, oriLocs);
    sortedPeaks = transpose(sortrows(toSortPeaks, 1, 'descend'));
    sortedL = length(sortedPeaks);
    if sortedL > firstKHarmonics
        sortedL = firstKHarmonics;
    end
    harm_coef = sortedPeaks(:, 1:sortedL);
    
    % DEBUG
    disp(harm_coef(2, 1));
    
end

