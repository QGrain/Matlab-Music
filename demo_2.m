% Usage : play(treble, treble_duration, bass, bass_duration)
%
%                  treble -> 高音音符
%         treble_duration -> 高音音符持续时间
%                    bass -> 低音音符
%           bass_duration -> 低音音符持续时间

function music = play(treble, treble_duration, bass, bass_duration)
fs = 11025;               % sampling frequency, 11025 Hz on PC/Mac
speed_factor = 2;      % cpu speed compensation factor

treble_vector = zeros(1,sum(treble_duration)*fs+1);  % treble vector generator
n1 = 1;                                              % starting index
for kk = 1:length(treble)
	keynum = treble(kk);
							                                %
	if (keynum == 0)                                  % rest period definition
		A = 0.0;                                       % amplitude at 0.0
		freq = 440;
	else
		A = 0.5;                                       % note amplitude at 0.5
		freq = 440 * (2^( (keynum-49)/12 ));           % frequency definition
	end
	tt = 0 : (1/fs) : (treble_duration(kk)/speed_factor);  % duration generator
	tone = A * cos( 2* pi* freq* tt);                      % tone generator
							                                     %
	n2 = n1 + length(tone) - 1;                            % ending index & concatenate vector
	treble_vector(n1:n2) = treble_vector(n1:n2) + tone;    % vector generator
	n1 = n2;                                               % reset index
end

bass_vector = zeros(1,sum(bass_duration)*fs+1);           % bass vector generator
n1 = 1;
for kk = 1:length(bass)
	keynum = bass(kk);
	%
	if (keynum == 0)
		A = 0;
		freq = 440;
	else
		A = 0.5;
		freq = 440 * (2^( (keynum-49)/12 ));
	end
	tt = 0 : (1/fs) : (bass_duration(kk)/speed_factor);
	tone = A * cos( 2* pi* freq* tt);
	%
	n2 = n1 + length(tone) - 1;
	bass_vector(n1:n2) = bass_vector(n1:n2) + tone;
	n1 = n2;
end

music_vector = treble_vector + bass_vector;      % treble and bass vector combination
sound( music_vector, fs )                        % generate sound
