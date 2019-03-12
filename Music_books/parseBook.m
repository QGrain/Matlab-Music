%Usage: [basic_info book_single] = parseBook(filename)
%   basic_info has the followings:
%       - speed
%       - 
function [basic_info book_single_beat] = parseBook(filename) 

    book = [];
    tline = [' '];
    format_info = '%d';
    %format_notechar = '%c';
    %format_notestring = '%s';

    disp('parse test start: ');
    fid  = fopen(filename, 'r');

    basic_info = fscanf(fid, format_info)

    %use fgetl(), return with a 1 x N cell
    while (tline ~= -1)
        tline = fgetl(fid);
        book = [book tline ' '];
    end

    book = deblank(book); %remove the head-blank and tail-blank. 
    if book(1) == '/'
        book(1);
        book(2);
        basic_info = [basic_info; uint8(book(2)-48)];
        book = book(4:end);
    end
    
    %split the string into single beat by ' '.
    book_cell = regexp(book, ' ', 'split');

    for j = 1:length(book_cell)
        book_single_beat(j).note_base = book_cell{j}(1);
        book_single_beat(j).note_offset = book_cell{j}(2);
        book_single_beat(j).scale = book_cell{j}(3);
        book_single_beat(j).time = book_cell{j}(5);
    end
    %method 2, use fscanf() with %c or %s, and use 'degress' label to split
    %note_char = fscanf(fid, format_notechar);
    %note_string = fscanf(fid, format_notestring);

    fclose(fid);
end