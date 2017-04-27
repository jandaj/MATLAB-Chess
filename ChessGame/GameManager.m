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
            manager.gamePieceArray{1,1} = Rook(0,[1,1]);
            manager.gamePieceArray{1,2} = Knight(0, [1,2]);
            manager.gamePieceArray{1,3} = Bishop(0, [1,3]);
            manager.gamePieceArray{1,4} = Queen(0, [1,4]);
            manager.gamePieceArray{1,5} = King(0, [1,5]);
            manager.gamePieceArray{1,6} = Bishop(0, [1,6]);
            manager.gamePieceArray{1,7} = Knight(0, [1,7]);
            manager.gamePieceArray{1,8} = Rook(0, [1,8]);
            
            manager.gamePieceArray{8,1} = Rook(1,[8,1]);
            manager.gamePieceArray{8,2} = Knight(1, [8,2]);
            manager.gamePieceArray{8,3} = Bishop(1, [8,3]);
            manager.gamePieceArray{8,4} = Queen(1, [8,4]);
            manager.gamePieceArray{8,5} = King(1, [8,5]);
            manager.gamePieceArray{8,6} = Bishop(1, [8,6]);
            manager.gamePieceArray{8,7} = Knight(1, [8,7]);
            manager.gamePieceArray{8,8} = Rook(1, [8,8]);
            
            for i = 1:8
                manager.gamePieceArray{2, i} = Pawn(0, [2,i]);
                manager.gamePieceArray{3, i} = GamePiece(-1);
                manager.gamePieceArray{4, i} = GamePiece(-1);
                manager.gamePieceArray{5, i} = GamePiece(-1);
                manager.gamePieceArray{6, i} = GamePiece(-1);
                manager.gamePieceArray{7, i} = Pawn(1, [7,i]);
            end
        end
        
        function [manager] = move(manager, position, axesObj, handles)
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
                    manager.gamePieceArray{y, x}.team == -1
                disp('cannot move an empty space');
                return;
            end
            
            % Check if piece is on the right team.
            [~, onTeam] = isOnTeam(manager, position);
            if onTeam == 1 && isempty(manager.storedPosition) == 1
                manager.storedPosition = position;
                disp('Position stored');
                disp(manager.storedPosition);
                
            elseif isempty(manager.storedPosition) == 0
                if onTeam == 0 || manager.gamePieceArray{y, x}.team == -1
                    % Check if move is valid (function will be implemented
                    % later when the actual piece classes are defined). For
                    % now, assume any move is valid.
                    
                    oldX = manager.storedPosition(1);
                    oldY = manager.storedPosition(2);
                    selectedPiece = manager.gamePieceArray{oldY, oldX};
                    modifiedPosition = [y, x]; % workaround cause we got position as x,y, but we need y,x for indexing
                    moveIsValid = selectedPiece.isValidMove(modifiedPosition);
                    
                    if moveIsValid == 1
                        previousPieceClass = class(manager.gamePieceArray{oldY, oldX});
                        previousPieceTeam = manager.gamePieceArray{oldY, oldX}.team;
                        
                        switch previousPieceClass
                            case 'Rook'
                                axes(axesObj);
                                delete(get(gca,'Children'));
                                if previousPieceTeam == 0
                                    [a,map,alpha] = imread('resources/pieces/white/rook.png');
                                    a = imshow('resources/pieces/white/rook.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                elseif previousPieceTeam == 1
                                    [a,map,alpha] = imread('resources/pieces/black/rook.png');
                                    a = imshow('resources/pieces/black/rook.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                end
                            case 'Pawn'
                                axes(axesObj);
                                delete(get(gca,'Children'));
                                if previousPieceTeam == 0
                                    [a,map,alpha] = imread('resources/pieces/white/pawn.png');
                                    a = imshow('resources/pieces/white/pawn.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                elseif previousPieceTeam == 1
                                    [a,map,alpha] = imread('resources/pieces/black/pawn.png');
                                    a = imshow('resources/pieces/black/pawn.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                end
                            case 'Bishop'
                                axes(axesObj);
                                delete(get(gca,'Children'));
                                if previousPieceTeam == 0
                                    [a,map,alpha] = imread('resources/pieces/white/bishop.png');
                                    a = imshow('resources/pieces/white/bishop.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                elseif previousPieceTeam == 1
                                    [a,map,alpha] = imread('resources/pieces/black/bishop.png');
                                    a = imshow('resources/pieces/black/bishop.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                end
                            case 'Knight'
                                axes(axesObj);
                                delete(get(gca,'Children'));
                                if previousPieceTeam == 0
                                    [a,map,alpha] = imread('resources/pieces/white/knight.png');
                                    a = imshow('resources/pieces/white/knight.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                elseif previousPieceTeam == 1
                                    [a,map,alpha] = imread('resources/pieces/black/knight.png');
                                    a = imshow('resources/pieces/black/knight.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                end
                            case 'Queen'
                                axes(axesObj);
                                delete(get(gca,'Children'));
                                if previousPieceTeam == 0
                                    [a,map,alpha] = imread('resources/pieces/white/queen.png');
                                    a = imshow('resources/pieces/white/queen.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                elseif previousPieceTeam == 1
                                    [a,map,alpha] = imread('resources/pieces/black/queen.png');
                                    a = imshow('resources/pieces/black/queen.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                end
                            case 'King'
                                axes(axesObj);
                                delete(get(gca,'Children'));
                                if previousPieceTeam == 0
                                    [a,map,alpha] = imread('resources/pieces/white/king.png');
                                    a = imshow('resources/pieces/white/king.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                elseif previousPieceTeam == 1
                                    [a,map,alpha] = imread('resources/pieces/black/king.png');
                                    a = imshow('resources/pieces/black/king.png');
                                    set(a, 'AlphaData', alpha);
                                    a.HitTest = 'off';
                                end
                        end
                        
                        previousAxes = findobj('UserData', manager.storedPosition);
                        axes(previousAxes);
                        delete(get(gca,'Children'));
                        [a,map,alpha] = imread('resources/pieces/empty.png');
                        a = imshow('resources/pieces/empty.png');
                        set(a, 'AlphaData', alpha);
                        a.HitTest = 'off';
                        
                        manager.gamePieceArray{y,x} = selectedPiece;
                        manager.gamePieceArray{oldY, oldX} = GamePiece(-1);
                        
                        manager.storedPosition = [];
                        % For debugging purposes
                        manager.gamePieceArray
                        
                        manager.turn = manager.turn + 1;
                    else 
                        disp('That move is not allowed for that piece!');
                        manager.storedPosition = [];
                    end
                else
                    disp('You cannot move there!');
                    manager.storedPosition = [];
                end
            else
                disp('Piece is not on your team!');
                manager.storedPosition = [];
            end
        end
        
        
        % Determine if a piece is on the correct team for a turn
        function [manager, onTeam] = isOnTeam(manager, position)
            x = position(1);
            y = position(2);
            
            % For debugging purposes
            piece = manager.gamePieceArray{y,x};
            
            % This function kept running for some reason, although a blank
            % piece should've been caught before the move function gets
            % here.
            
            
            if mod(manager.turn, 2) == 0
                if piece.team == 0
                    onTeam = 1;
                elseif piece.team == -1
                    onTeam = 1;
                else
                    onTeam = 0;
                end
            else
                if piece.team == 1
                    onTeam = 1;
                elseif piece.team == -1
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