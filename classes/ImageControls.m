classdef ImageControls < handle
    %IMAGECONTROLS Controls which image is displayed by the Cena Viewer.
    %   Contains ui buttons that cycle through the images of John Cena.
    
    properties(SetAccess = 'private')
        % The parent figure of this UI object.
        parentFig = [];
        
        % Buttons
        prevBtn = [];
        randBtn = [];
        nextBtn = [];
    end
    
    methods
        function obj = ImageControls(parent)
            % CONSTRUCTOR
            
            obj.parentFig = parent;
            
            obj.prevBtn = uicontrol('Parent', obj.parentFig,...
                                    'Style', 'pushbutton',...
                                    'String', 'Previous',...
                                    'Units', 'normalized',...
                                    'Position', [0.01 0.01 0.1 0.05],...
                                    'UserData', obj,...
                                    'Callback', @(obj, e)obj.UserData.previousImage);
            obj.randBtn = uicontrol('Parent', obj.parentFig,...
                                    'Style', 'pushbutton',...
                                    'String', 'Random',...
                                    'Units', 'normalized',...
                                    'Position', [0.115 0.01 0.07 0.05],...
                                    'UserData', obj,...
                                    'Callback', @(obj, e)obj.UserData.randomImage);
            obj.nextBtn = uicontrol('Parent', obj.parentFig,...
                                    'Style', 'pushbutton',...
                                    'String', 'Next',...
                                    'Units', 'normalized',...
                                    'Position', [0.19 0.01 0.1 0.05],...
                                    'UserData', obj,...
                                    'Callback', @(obj, e)obj.UserData.nextImage);
        end
        
        function previousImage(obj, ~)
            % FUNCTION
            
            handles = guidata(obj.parentFig);
            handles.cenaViewer.previousImage;
            handles.cenaQuoter.previousQuote;
        end
        
        function randomImage(obj, ~)
            % FUNCTION
            
            handles = guidata(obj.parentFig);
            handles.cenaViewer.randomImage;
            handles.cenaQuoter.randomQuote;
        end
        
        function nextImage(obj, ~)
            % FUNCTION
            
            handles = guidata(obj.parentFig);
            handles.cenaViewer.nextImage;
            handles.cenaQuoter.nextQuote;
        end
    end
end