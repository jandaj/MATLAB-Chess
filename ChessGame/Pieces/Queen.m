classdef Queen < GamePiece
    properties
        position;
    end
    
    methods
        function queen = Queen(team, position)
            queen = queen@GamePiece(team);
            queen.position = position;
        end 
        function valid = isValidMove(queen, newPosition)
            x = newPosition(1);
            y = newPosition(2);
            initX = queen.position(1);
            initY = queen.position(2);
            deltaX = x - initX;
            deltaY = y - initY;
            
            if deltaY == 0 && deltaX == 0
                valid = 0;
            elseif abs(deltaY) == abs(deltaX)
                valid = 1;
            elseif deltaY == 0 && deltaX ~=0
                valid = 1;
            elseif deltaX == 0 && deltaY ~=0
                valid = 1;
            else
                valid = 0;
            end
            if valid == 1
                queen.position(1) = x;
                queen.position(2) = y;
            end
        end
    end
end
