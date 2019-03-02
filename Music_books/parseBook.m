%Usage: parseBook(filename)

clear;clc;

format_info = '%d';
format_notechar = '%c';
%format_notestring = '%s';

disp('parse test start:');
fid  = fopen('test_book.txt', 'r');

info = fscanf(fid, format_info);

notes = [];
tline = [' '];

%method 1, use fgetl(), return with a 1xn cell
while (tline ~= -1)
    tline = fgetl(fid);
    notes = [notes tline ' '];
end

notes = deblank(notes);
S = regexp(notes, ' ', 'split');

%method 2, use fscanf() with %c or %s, and use 'degress' label to split
%note_char = fscanf(fid, format_notechar);
%note_string = fscanf(fid, format_notestring);

fclose(fid);