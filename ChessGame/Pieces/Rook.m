classdef Rook < GamePiece
    properties
        position;
    end
    
    methods
        function rook = Rook(team, position)
            rook = rook@GamePiece(team);
            rook.position = position;
        end
        
        function valid = isValidMove(rook, newPosition)
            x = newPosition(1);
            y = newPosition(2);
            initX = rook.position(1);
            initY = rook.position(2);
            deltaX = x - initX;
            deltaY = y - initY;
            valid = 0;
            if deltaX ~= 0 && deltaY == 0
                valid = 1;
                rook.position = newPosition;
                return;
            end
            if deltaY ~= 0 && deltaX == 0
                valid = 1;
                rook.position = newPosition;
                return;
            end
            if valid == 1
                rook.position(1) = x;
                rook.position(2) = y;
            end
        end
    end
end