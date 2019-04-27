

function testRealtimeEuqalizer(freqParameter, pause, exit)
    ranges = [0 31 62 125 250 500 1000 2000 4000 8000 16000 20000];  % 12

    %%%%%%%%%%%% Options list %%%%%%%%%%%%%%
    %pause = 0;
    exit = 0;
    isSpectrumDomain = 1;

    audioName = '../mp3/Endeavors.mp3';

    changed = 1;
    %filterCoefs = [2 2 2 1 1 1 1 1 1 1]; 
    filterCoefs = freqParameter;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    % 频域范围大约是采样率的一半

    File = dsp.AudioFileReader(audioName);
    File.SamplesPerFrame = 1000;  % This parameter determines the frequency of ploting 

    Fs = File.SampleRate;
    mult = ceil(Fs / File.SamplesPerFrame);
    usedFs = mult * File.SamplesPerFrame; % Approximately Fs (46000)

    Out = audioDeviceWriter('SampleRate', File.SampleRate); % Speaker
    Spectrum = dsp.SpectrumAnalyzer('SampleRate',Fs, 'PlotAsTwoSidedSpectrum', false,'FrequencyScale', 'Log', 'SpectrumType', 'RMS');

    % Initialization
    spectCoefs = ones([usedFs 1]);


    x = step(File);

    tic
    while (toc < 2 || any(x(:,1))) && ~exit % (toc < 2) avoids stopping at the begining
        if (~pause)        % 
            newX = x;
            for i = 1:(mult-1)
                newX = [newX; x];
            end
            newX = newX';
            % Get the original
            if (isSpectrumDomain) 
                if (changed)  % Change the spectCoefs
                    changed = 0;
                    filterCoefs = [filterCoefs(1) filterCoefs filterCoefs(end)];
                    spectCoefs = [];
                    for i = 1:(length(filterCoefs)-2)
                        spectCoefs = [spectCoefs linspace(filterCoefs(i), filterCoefs(i+1), ceil(usedFs/2*(ranges(i+1)-ranges(i))/20000))]; % half the size of newX
                    end
                    spectCoefs = [spectCoefs filterCoefs(end) * ones([1 round(usedFs/2)-length(spectCoefs)])];
                    if mod(usedFs, 2)
                        spectCoefs = [spectCoefs 0 fliplr(specCoefs)];
                    else
                        spectCoefs = [spectCoefs fliplr(spectCoefs)];
                    end
                end
                newX(1,:) = fft(newX(1,:)) .* spectCoefs;
                newX(2,:) = fft(newX(2,:)) .* spectCoefs;
            end
            newX(1,:) = ifft(newX(1,:));
            newX(2,:) = ifft(newX(2,:));    
            newX = real(newX(:,1:File.SamplesPerFrame)');
            step(Spectrum, [newX(:,1) x(:,1)]);
            step(Out, newX); 
            x = step(File);
        end
    end
end
