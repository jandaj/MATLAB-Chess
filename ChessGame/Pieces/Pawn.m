classdef Pawn < GamePiece
    properties
        position;
    end
    
    methods
        function pawn = Pawn(team, position)
            pawn = pawn@GamePiece(team);
            pawn.position = position;
        end
        
        function valid = isValidMove(pawn, newPosition)
            x = newPosition(1);
            y = newPosition(2);
            initX = pawn.position(1);
            initY = pawn.position(2);
            deltaX = x - initX;
            deltaY = y - initY;
  
            if pawn.team == 0
                if deltaX == 1 && deltaY == 0
                    valid = 1;
                else 
                    valid = 0;
                end
            else
                if deltaX == -1 && deltaY == 0
                    valid = 1;
                else 
                    valid = 0;
                end
            end
        end
    end
end