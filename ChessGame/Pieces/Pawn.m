classdef Pawn < GamePiece
    properties
        position;
    end
    
    methods
        function pawn = Pawn(team, position)
            pawn = pawn@GamePiece(team);
            pawn.position = position;
        end 
    end
end