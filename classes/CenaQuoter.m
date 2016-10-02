classdef CenaQuoter < handle
    %CENAQUOTER Summary of this class goes here
    %   This class loads and displays quotes by John Cena.
    
    properties(SetAccess = 'private')
        % The parent figure of this UI object.
        parentFig = [];
        
        % UIControl text for the quotes.
        quoteBox = [];
    end
    
    properties(Access = 'private')
        quoteList = {};
        quoteIdx = [];
    end
    
    methods
        function obj = CenaQuoter(parent)
            % CONSTRUCTOR
            
            obj.parentFig = parent;
            
            obj.quoteBox = uicontrol('Parent', obj.parentFig,...
                                     'Style', 'text',...
                                     'Units', 'normalized',...
                                     'Position', [0.01 0.1 0.28 0.45],...
                                     'HorizontalAlignment', 'left',...
                                     'FontSize', 17);
                                 
            % Load quotes from cenaQuote.txt
            % Get the path to the resource folder.
            resourcePath = fileparts(obj.parentFig.UserData);
            resourcePath = fullfile(resourcePath, 'resources', 'cenaQuote.txt');
            
            try
                fid = fopen(resourcePath, 'r');
                quotes = textscan(fid, '%s', 'Delimiter','\n');
                obj.quoteList = quotes{1};
            catch
                % If something goes wrong; we'll use the quote box to tell
                % the user.
                obj.quoteList = {'Could not load John Cena quotes; is the resources folder missing?'};
            end
            
            % Setup random quote to start.
            obj.randomQuote;
        end
        
        function obj = previousQuote(obj)
            % FUNCTION
            
            obj.quoteIdx = obj.quoteIdx - 1;
            if obj.quoteIdx <= 0
            	obj.quoteIdx = size(obj.quoteList, 1);
            end
            
            obj.makeQuote;
        end
        
        function obj = randomQuote(obj)
            % FUNCTION
            
            obj.quoteIdx = randi(size(obj.quoteList, 1), 1);
            obj.makeQuote;
        end
        
        function obj = nextQuote(obj)
            % FUNCTION
            
            obj.quoteIdx = obj.quoteIdx + 1;
            if obj.quoteIdx > size(obj.quoteList, 1)
                obj.quoteIdx = 1;
            end
            
            obj.makeQuote;
        end
        
        function makeQuote(obj)
            % FUNCTION
            
            quote = sprintf([obj.quoteList{obj.quoteIdx} '\n-John Cena']);
            obj.quoteBox.String = quote;
        end
    end
    
end

