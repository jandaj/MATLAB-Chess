classdef Rook < GamePiece
    properties
        position;
    end
    
    methods
        function rook = Rook(team, position)
            rook = rook@GamePiece(team);
            rook.position = position;
        end 
        
        % Fix this
        function valid = isValidMove(rook, position)
            valid = true;
        end
    end
end