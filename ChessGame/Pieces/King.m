classdef King < GamePiece
    properties
        position;
    end
    
    methods
        function king = King(team, position)
            king = king@GamePiece(team);
            king.position = position;
        end 
        
        
        function valid = isValidMove(King, newPosition)
            x = newPosition(1);
            y = newPosition(2);
            initX = King.position(1);
            initY = King.position(2);
            if(abs(x-initX)<=1)
                if(abs(y-initY)<=1) 
                    valid = 1;
                else
                    valid = 0;
                end
            else valid = 0;
            end
            if valid == 1
                King.position(1) = x;
                King.position(2) = y;
            end
        end
    end
end