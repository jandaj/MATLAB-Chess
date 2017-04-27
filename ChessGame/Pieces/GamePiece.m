classdef GamePiece < handle
    properties
        
        team;           % 0 = player team, 1 = opponent team, -1 = empty space
                        
    end
    
    methods
        function piece = GamePiece(inputTeam)
            if nargin > 0 
                piece.team = inputTeam;
            end
        end
    end
end