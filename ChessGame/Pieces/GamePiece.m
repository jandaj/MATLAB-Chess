classdef GamePiece < handle
    properties
        position;
    end
    
    methods
        function obj = setPosition(obj, xPosition, yPosition)
            % Just in case we ever need to change a position on the fly
            obj.position = [xPosition, yPosition];
        end
        
        function obj = moveToSpace(obj, newX, newY)
            % The idea is to override this in every class, but just in
            % case, we can throw an error.
            error('You forgot to override the moveToSpace function')
        end
    end
end