classdef LevelSlider < handle
    %LIMITSLIDER Changes the CLim of the cenaView object.
    %   This slider manipulates the CLim property.
    
    properties(SetAccess = 'private')
        % Parent figure to hold the list.
        parentFig = [];
        
        % The text label.
        guiLabel = [];
        
        % The slider object.
        guiSlider = [];
    end
    
    methods
        function obj = LevelSlider(parent)
            % CONSTRUCTOR
            
            obj.parentFig = parent;
            
            % Create the GUI label.
            obj.guiLabel = uicontrol('Parent', obj.parentFig,...
                                     'Style', 'text',...
                                     'Units', 'normalized',...
                                     'Position', [0.01 0.62, 0.28 0.05],...
                                     'HorizontalAlignment', 'left',...
                                     'FontSize', 16,...
                                     'String', 'Level');
            obj.guiSlider = uicontrol('Parent', obj.parentFig,...
                                      'Style', 'slider',...
                                      'Units', 'normalized',...
                                      'Min', 0,...
                                      'Max', 254,...
                                      'Value', 0,...
                                      'Position', [0.01 0.59 0.28 0.03]);

            % Setup Selection Callback
            obj.guiSlider.Callback = @obj.changeLevel;
        end
        
        function changeLevel(obj, ~, ~)
            % FUNCTION
            
            handles = guidata(obj.parentFig);
            value = obj.guiSlider.Value;
            handles.cenaViewer.changeMinCLim(value);
            
        end
    end    
end