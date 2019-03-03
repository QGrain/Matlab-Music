%Usage: [basic_info book_single] = parseBook(filename)
function [basic_info book_single] = parseBook(filename) 

    book = [];
    tline = [' '];
    format_info = '%d';
    %format_notechar = '%c';
    %format_notestring = '%s';

    disp('parse test start:');
    fid  = fopen('test_book.txt', 'r');

    basic_info = fscanf(fid, format_info)

    %method 1, use fgetl(), return with a 1*n cell
    while (tline ~= -1)
        tline = fgetl(fid);
        book = [book tline ' '];
    end

    book = deblank(book);
    if book(1) == '/'
        book(1)
        book(2)
        basic_info = [basic_info; uint8(book(2)-48)];
        book = book(4:end);
    end
    
    book_cell = regexp(book, ' ', 'split');

    for j = 1:length(book_cell)
        book_single(j).note = book_cell{j}(1);
        book_single(j).scale = book_cell{j}(2);
        book_single(j).time = book_cell{j}(4);
    end
    %method 2, use fscanf() with %c or %s, and use 'degress' label to split
    %note_char = fscanf(fid, format_notechar);
    %note_string = fscanf(fid, format_notestring);

    fclose(fid);
end