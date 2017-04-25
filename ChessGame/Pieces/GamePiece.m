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
       
        
        function obj = isValidMove(obj, newX, newY)
            % The idea is to override this in every class, but just in
            % case, we can throw an error.
            error('You forgot to override the isValidMove function')
        end
        
        
    end
end