classdef PlayerPawn < handle & GamePiece
% Code for the Pawn chess piece.
    properties 
        % Any Pawn-specific variables can go here
    end
    
    methods
        function pawn = PlayerPawn(x, y)
            if x > 0 && x < 9 && y == 2 
              pawn.position = [x, y];
            else
                error('Invalid position')
            end
          
        end
         
        function obj = moveToSpace(obj, newX, newY)
            % Basically just a bunch of if statements that determine
            % whether a move is valid or not
            if newX ~= obj.position(1)
                error('Invalid move')
            end
            if obj.position(2) == 2
                if newY == 3 || newY == 4
                    obj.position(2) = newY; 
                    
                else 
                    error('Invalid position');
                end
            else 
                if newY == obj.position(2) + 1
                    obj.position(2) = newY;
                  
                else
                    error('Invalid position');
                end
            end
        end
    end
end
    
    
        
        