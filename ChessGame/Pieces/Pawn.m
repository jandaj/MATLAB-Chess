classdef Pawn < GamePiece
    properties
        position;
        first = 1;
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
                if deltaX == 2 && deltaY == 0 && pawn.first == 1
                    valid = 1;
                    pawn.first = 0;
            elseif deltaX == 1 && deltaY == 0
                    valid = 1;
                    pawn.position = newPosition;
                else 
                    valid = 0;
                end
            else
                if deltaX == -2 && deltaY == 0 && pawn.first == 1
                    valid = 1;
                    pawn.first = 0;
                elseif deltaX == -1 && deltaY == 0
                    valid = 1;
                    pawn.position = newPosition;
                else 
                    valid = 0;
                end
            end
            if valid == 1
                pawn.position(1) = x;
                pawn.position(2) = y;
            end
        end
    end
end