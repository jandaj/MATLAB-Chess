% This function works for any GUI object, but it requires a global field of
% handles to be declared, called pieceString. If you want to use it with
% some other data type, you'll have to use different
% comparison/getter/setter methods to make the function work.

function handles = moveToSpace(buttonObj, handles)
    emptyImage = imread('resources/pieces/empty.png');
    
    if 
        handles.pieceString = get(buttonObj, 'String');
        set(buttonObj, 'BackgroundColor', 'yellow');
        set(buttonObj, 'String', '');
        disp('Piece string is empty');
        disp(handles.pieceString);
    else
        set(buttonObj, 'String', handles.pieceString);
        h = findobj('BackgroundColor', 'yellow');
        set(h, 'BackgroundColor', 'white');
        handles.pieceString = '';
        disp('Piece string is not empty');    
    end
    guidata(buttonObj, handles);    
end