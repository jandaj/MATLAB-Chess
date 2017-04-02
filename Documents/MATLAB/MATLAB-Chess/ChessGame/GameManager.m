classdef GameManager < handle
    % GameManager keeps track of moves and positions of pieces in an 8x8
    % array.
    
    % TODO: actually create an array of pieces (we'll probably have to do
    % this after we make the classes for each piece)
    properties
        gamePieceArray;
        turn;
    end
    methods
        function manager = GameManager()
            % Constructor for the GameManager class. Should instantiate
            % the game pieces in an array.
        end
        
        function advanceTurn(obj)
            obj.turn = obj.turn  + 1;
        end
    end
end