classdef Bishop < GamePiece
    properties
        position;
    end
    
    methods
        function bishop = Bishop(team, position)
            bishop = bishop@GamePiece(team);
            bishop.position = position;
        end
        
        function valid = isValidMove(bishop, newPosition)
            x = newPosition(1);
            y = newPosition(2);
            initX = bishop.position(1);
            initY = bishop.position(2);
            deltaX = x - initX;
            deltaY = y - initY;
            
            if deltaY == 0 && deltaX == 0
                valid = 0;
            elseif abs(deltaY) == abs(deltaX)
                valid = 1;
            else
                valid = 0;
            end
        end
    end
end