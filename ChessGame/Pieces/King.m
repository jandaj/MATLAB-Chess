classdef King < GamePiece
    properties
        position;
    end
    
    methods
        function king = King(team, position)
            king = king@GamePiece(team);
            king.position = position;
        end 
        
        
        % Fix this
        function valid = isValidMove(king, position)
            valid = true;
        end
    end
end