classdef ColormapPicker < handle
    %COLORMAPPICKER List of colormaps to choose from!
    %   Allows the user to select a colormap for a given axes.
    
    properties(SetAccess = 'private')
        % Parent figure to hold the list.
        parentFig = [];
        
        % The text label.
        guiLabel = [];
        
        % The list object.
        colormapList = [];
    end
    
    methods
        function obj = ColormapPicker(parent)
            % CONSTRUCTOR
            
            obj.parentFig = parent;         

            % Create the GUI label.
            obj.guiLabel = uicontrol('Parent', obj.parentFig,...
                                     'Style', 'text',...
                                     'Units', 'normalized',...
                                     'Position', [0.01 0.95, 0.28 0.05],...
                                     'HorizontalAlignment', 'left',...
                                     'FontSize', 16,...
                                     'String', 'Colormap Selection');
            
            % Create the listbox.
            obj.colormapList = uicontrol('Parent', obj.parentFig,...
                                         'Style', 'listbox',...
                                         'Units', 'normalized',...
                                         'Position', [0.01 0.7 0.28 0.25]);
                                     
            % Hard coded list of colormap names.
            names = {'Parula',...
                     'Jet',...
                     'HSV',...
                     'Hot',...
                     'Cool',...
                     'Spring',...
                     'Summer',...
                     'Autumn',...
                     'Winter',...
                     'Gray',... % Default Selection
                     'Bone',...
                     'Copper',...
                     'Pink'};
            
            % Put list into listbox.
            obj.colormapList.String = names; 
            
            % Set Default Selection
            obj.colormapList.Value = 10;
            
            % Setup Selection Callback
            obj.colormapList.Callback = @obj.changeColormap;
        end
        
        function changeColormap(obj, ~, ~)
            % FUNCTION
            
            handles = guidata(obj.parentFig);
            
            name = obj.colormapList.String{obj.colormapList.Value};
            handles.cenaViewer.changeColormap(name);
        end
        
        function setFocus(obj)
            % FUNCTION
            
            uicontrol(obj.colormapList);
        end
    end
end