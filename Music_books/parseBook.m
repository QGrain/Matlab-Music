%Usage: [basic_info book_single] = parseBook(filename)
%   'book_single'has the following members:
%       - key:     The frequency of current beat.
%       - time:    How long a period is between this and next beat.
%       - isChord: Determines whether this beat is chord or not.
%       - envType: Designates which music example to use.

% function [basic_info book_single_beat] = parseBook(filename) 
function book_single_beat = book_single_beat(filename)

    %initialization
    book = [];
    tline = [' '];
    format_info = '%d';

    fid  = fopen(filename, 'r');

    basic_info = fscanf(fid, format_info);

    %use fgetl(), return with a 1 x N cell
    while (tline ~= -1)
        tline = fgetl(fid);
        book = [book tline ' '];
    end
    fclose(fid);

    book = deblank(book); %remove the head-blank and tail-blank. 
    %parse '/', and complete book_info
    if book(1) == '/'
        basic_info = [basic_info; str2num(book(2))];
        book = book(4:end);
    end
    
    %split the string into single beat by ' '.
    book_cells = regexp(book, ' ', 'split');
    
    for j = 1:length(book_cells)
        [key envType] = transformKey(book_cells{j}(1), book_cells{j}(2), book_cells{j}(3));
        book_single_beat(j).key = key;
        book_single_beat(j).envType = envType;
        book_single_beat(j).isChord = isChord(book_cells{j}(4));   % When the fourth character isn't '_', then it's chord
        book_single_beat(j).time = getTime(str2num(book_cells{j}(5)), basic_info);
    end
    

end

function [key envType] = transformKey(note_base, note_offset, scale)
    if note_base == 'N'
        key = 0;
        envType = 0;
    else
        ref_freq = 261.63; % freq for C-4
        
        ref_scale = noteScale('C', '-', '4');
        absolute_scale = noteScale(note_base, note_offset, scale);
        key = ref_freq * 2^((absolute_scale - ref_scale)/12);
        
        minus = absolute_scale - noteScale('C', '-', scale);
        if minus < 6
            envType = (scale-'0') * 2 + 1;
        else
            envType = (scale-'0') * 2 + 2;
        end
    end
end

function note_scale = noteScale(note_base, note_offset, scale)
    % Do conversions between the tags and the notes 
    switch (note_base)
        case 'C'
            note_scale = 1;
        case 'D'
            note_scale = 3;
        case 'E'
            note_scale = 5;
        case 'F'
            note_scale = 6;
        case 'G'
            note_scale = 8;
        case 'A'
            note_scale = 10;
        case 'B'
            note_scale = 12;
        otherwise
            note_scale = 0;
    end

    if note_offset == '#'
        note_scale = note_scale + 1;
    end
    if note_offset == 'b'
        note_scale = note_scale - 1;
    end
    
    note_scale = note_scale + 12 * (str2num(scale));
end

function is_chord = isChord(label)
    % Check if it's chord or not according to the label
    if label == '_'
        is_chord = 0;
    else
        is_chord = 1;
    end
end

function time = getTime(timeLabel, basic_info)
    % This function converts the timeLabel into time lantency
    time = 60.0 / basic_info(1) * 2^(1 - timeLabel) / basic_info(3);
end
    
    