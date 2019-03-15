%Usage: [basic_info book_single] = parseBook(filename)
%   'basic_info' has the followings:
%       - speed
%       - 每小节几拍
%       - 几分音符为一拍
%   'book_single'has the followings:
%       - key
%       - time

function [basic_info book_single_beat] = parseBook(filename) 

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

    book = deblank(book); %remove the head-blank and tail-blank. 
    %parse '/', and complete book_info
    if book(1) == '/'
        basic_info = [basic_info; uint8(book(2)-48)];
        book = book(4:end);
    end
    
    %split the string into single beat by ' '.
    book_cell = regexp(book, ' ', 'split');

    for j = 1:length(book_cell)
        [key envType] = transformKey(book_cell{j}(1), book_cell{j}(2), book_cell{j}(3));
        book_single_beat(j).key = key;
        book_single_beat(j).envType = envType;
        book_single_beat(j).isChord = isChord(book_cell{j}(4));
        book_single_beat(j).time = book_cell{j}(5);
    end
    
    fclose(fid);
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
    
    note_scale = note_scale + 12 * (scale-'0');
end

function is_chord = isChord(label)
    if label == '_'
        is_chord = 0;
    else
        is_chord = 1;
    end
end