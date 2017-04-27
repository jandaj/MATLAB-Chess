classdef Bishop < GamePiece
    properties
        position;
    end
    
    methods
        function bishop = Bishop(team, position)
            bishop = bishop@GamePiece(team);
            bishop.position = position;
        end 
        
        
        % Fix this
        function valid = isValidMove(bishop, position)
            valid = true;
        end
    end
end