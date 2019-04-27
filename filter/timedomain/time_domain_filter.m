function AudioData = time_domain_filter(audio, n1, n2, omiga)
%low pass filter with omiga.
    audio_left = audio(n1:n2, 1);
    audio_right = audio(n1:n2, 2);
    
    AudioData_left = zeros(n2-n1+1,1);
    AudioData_right = zeros(n2-n1+1,1);
    n = [n1:1:n2];
    
    h = [];
    for num = [n1:n2]
        h_temp = sin(omiga*num)/(2*pi*num);
        h = [h, h_temp];
    end
    
    for num = [n1:n2]
        for k = [n1:num]
            AudioData_left(num) = AudioData_left(num) + audio_left(k)*getHValue(num-k, omiga);
        end
    end
    
    for num = [n1:n2]
        for k = [n1:n2]
            AudioData_right(num) = AudioData_right(num) + audio_right(k)*getHValue(num-k, omiga);
        end
    end
    %AudioData_left = []
    AudioData = [AudioData_left, AudioData_right];
end

function hValue = getHValue(n, w)
    if n == 0
        hValue = w;
    else
        hValue = sin(w*n)/(2*pi*n);
    end
end