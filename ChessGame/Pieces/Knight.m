classdef Knight < GamePiece
    properties
        position;
    end
    
    methods
        function knight = Knight(team, position)
            knight = knight@GamePiece(team);
            knight.position = position;
        end 
    end
end