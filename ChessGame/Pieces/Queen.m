classdef Queen < GamePiece
    properties
        position;
    end
    
    methods
        function queen = Queen(team, position)
            queen = queen@GamePiece(team);
            queen.position = position;
        end 
    end
end