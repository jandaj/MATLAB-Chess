classdef Knight < GamePiece
    properties
        position;
    end
    
    methods
        function knight = Knight(team, position)
            knight = knight@GamePiece(team);
            knight.position = position;
        end 
        
        
        % Fix this
        function valid = isValidMove(knight, position)
            valid = true;
        end
    end
end