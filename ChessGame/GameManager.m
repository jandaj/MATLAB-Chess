classdef GameManager < handle
   
    properties
        gamePieceArray;
        storedPosition = [];
        turn = 0;
    end
    
    
    methods
        % Constructor - call this by saying obj = GameManager().
        % Initialize a CELL ARRAY of GamePiece objects.
        % Use {} to index gamePieceArray instead of ()
        % The reference to each GamePiece object is the index, we identify
        % different pieces by their indices, which are their positions on
        % the board.
        function manager = GameManager()
            manager.gamePieceArray = {};
            for i = 1:8
                manager.gamePieceArray{1, i} = GamePiece(0);
                manager.gamePieceArray{2, i} = GamePiece(0);
                manager.gamePieceArray{7, i} = GamePiece(1);
                manager.gamePieceArray{8, i} = GamePiece(1);
            end
        end
        
        function [manager, pieceArray] = move(manager, position, axesObj, handles)
            % parameter - 'manager' is a reference to the class
            % parameter - 'position' is a 1x2 array with the x,y coordinate
            % parameter - 'axesObj' is a reference to the axes whose
            %             callback function calls this function
            % parameter - 'handles' lets us access GUI data, pass in the
            %             the same handles that are an argument to the
            %             callback function
            x = position(1);
            y = position(2);
            
            % Check if piece is empty
            if isempty(manager.storedPosition) == 1&& ...
                    isempty(manager.gamePieceArray{x,y}) == 1
                disp('cannot move an empty space');
                return;
            end
            
            % Check if piece is on the right team.
            [~, onTeam] = isOnTeam(manager, position);
            if onTeam == 1
                % Check if we're selecting a piece, or moving a piece
                if isempty(manager.storedPosition) == 1
                    manager.storedPosition = position;
                    disp('Position stored');
                    disp(manager.storedPosition);
                    % Change the image of axesObj to the highlighted image
                else
                    % Check if move is valid (function will be implemented
                    % later when the actual piece classes are defined). For
                    % now, assume any move is valid.
                    
                    % This is the 'back end' of the logic. Controlling all
                    % the pieces on our imaginary gamePieceArray. This
                    % section runs if we've selected a piece and want to
                    % move it somewhere else.
                    
                    % TODO: Switch the image on the axes at 'position' to
                    % the image on the axes at 'storedPosition', and set
                    % the image on the axes at 'storedPosition' to
                    % empty.png
                    
                    oldX = manager.storedPosition(1);
                    oldY = manager.storedPosition(2);
                    selectedPiece = manager.gamePieceArray{oldX, oldY};
                   
                    manager.gamePieceArray{x,y} = selectedPiece;
                    manager.gamePieceArray{oldY, oldX} = [];
                    
                    % For debugging purposes
                    manager.gamePieceArray
                    
                    manager.turn = manager.turn + 1;
                end
            elseif onTeam == 1
                disp('Piece is not on your team!');
            else    % TODO: Figure out why this is happening.
                disp('This is where the bug is');
            end
            pieceArray = manager.gamePieceArray;
        end
        
        
        % Determine if a piece is on the correct team for a turn
        function [manager, onTeam] = isOnTeam(manager, position)
            x = position(1);
            y = position(2);
            
            % For debugging purposes
            piece = manager.gamePieceArray{y,x}
            
            % This function kept running for some reason, although a blank
            % piece should've been caught before the move function gets
            % here.
            if isempty(piece) == 1
                onTeam = 2;
                return;
            end
            
            if mod(manager.turn, 2) == 0
                if piece.team == 0
                    onTeam = 1;
                else
                    onTeam = 0;
                end
            else
                if piece.team == 1
                    onTeam = 1;
                else
                    onTeam = 0;
                end
            end
        end
        
        
        % Don't know if we'll need this yet.
        function advanceTurn(obj)
            obj.turn = obj.turn  + 1;
        end
    end
end