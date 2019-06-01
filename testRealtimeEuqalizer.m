ranges = [0 31 62 125 250 500 1000 2000 4000 8000 16000 20000];  % 12 个均衡中心频率

%%%%%%%%%%%% Options list %%%%%%%%%%%%%%
pause = 0;
exit = 0;
isSpectrumDomain = 0;

audioName = 'Soaring.mp3';

changed = 1;
filterCoefs = [2 2 2 1 1 1 1 1 1 1]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 频域范围大约是采样率的一半

File = dsp.AudioFileReader(audioName);
File.SamplesPerFrame = 1000;  % This parameter determines the frequency of ploting 

SPF = File.SamplesPerFrame;
Fs = File.SampleRate;
mult = ceil(Fs / SPF);
usedFs = mult * SPF; % Approximately Fs (46000)

Out = audioDeviceWriter('SampleRate', File.SampleRate); % Speaker
Spectrum = dsp.SpectrumAnalyzer('SampleRate',Fs, 'PlotAsTwoSidedSpectrum', false,'FrequencyScale', 'Log', 'SpectrumType', 'RMS');

% Initialization
spectCoefs = ones([usedFs 1]);


x = step(File);

tic
while (toc < 2 || any(x(:,1))) && ~exit % (toc < 2) avoids stopping at the begining
    if (~pause)        % 
        newX = x;
        
        % 扩展音频片段
        for i = 1:(mult-1)
            newX = [newX; x];
        end
        newX = newX';
        
        % 根据GUI的调整情况进行Lazy更新（按需更新）
        if (changed)
            changed = 0;
            
            % 构造滤波器向量
            filterCoefs = [filterCoefs(1) filterCoefs filterCoefs(end)];  % 均衡器参数
            spectCoefs = [];                                              % 根据均衡器参数产生的频谱包络
            for i = 1:(length(filterCoefs)-2)
                spectCoefs = [spectCoefs linspace(filterCoefs(i), filterCoefs(i+1), ceil(usedFs/2*(ranges(i+1)-ranges(i))/20000))]; % half the size of newX
            end
            spectCoefs = [spectCoefs filterCoefs(end) * ones([1 round(usedFs/2)-length(spectCoefs)])];
            if mod(usedFs, 2)
                spectCoefs = [spectCoefs 0 fliplr(specCoefs)];
            else
                spectCoefs = [spectCoefs fliplr(spectCoefs)];
            end
            
            timeCoefs = real(ifft(spectCoefs))*10;
        end
        
        % 产生新向量
        if (isSpectrumDomain) 
            newX(1,:) = fft(newX(1,:)) .* spectCoefs;
            newX(2,:) = fft(newX(2,:)) .* spectCoefs;
        else
            newX = [newX(1,1:SPF); newX(2,1:SPF)];
             temp = conv(timeCoefs, newX(1,:));
             plot(1:length(timeCoefs), timeCoefs);
             newX(1,:) = temp(1:SPF);
             temp = conv(timeCoefs, newX(2,:));
             newX(2,:) = temp(1:SPF);
        end 
        
        % 作逆变换，提取音频片段并且播放
        newX(1,:) = ifft(newX(1,:));
        newX(2,:) = ifft(newX(2,:));
        newX = real(newX(:,1:SPF)');
        step(Spectrum, [newX(:,1) x(:,1)]);
        step(Out, newX);
        x = step(File);
    end
end
