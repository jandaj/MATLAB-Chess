classdef King < GamePiece
    properties
        position;
    end
    
    methods
        function king = King(team, position)
            king = king@GamePiece(team);
            king.position = position;
        end 
    end
end