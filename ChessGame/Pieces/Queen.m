classdef Queen < GamePiece
    properties
        position;
    end
    
    methods
        function queen = Queen(team, position)
            queen = queen@GamePiece(team);
            queen.position = position;
        end 
        
        
        % Fix this
        function valid = isValidMove(queen, position)
            valid = true;
        end
    end
end