classdef CenaViewer < handle
    %CENAVIEWER Displays images of John Cena.
    %   This class creates a specialized axes for images of John Cena.
    
    properties(SetAccess = 'private')
        % The parent figure of this UI object.
        parentFig = [];
        
        % Axes object.
        viewAxes = [];
        
        % Container for John Cena images.
        cenaImg = {};
        
        % Index of Current John Cena image.
        cenaIdx = [];
    end
    
    methods
        function obj = CenaViewer(parent)
            % CONSTRUCTOR
            
            obj.parentFig = parent;
            
            % Create an axes object.
            obj.viewAxes = axes('Parent', obj.parentFig,...
                                'Units', 'normalized',...
                                'Position', [0.3 0 0.7 1],...
                                'Box', 'on',...
                                'XTick', [],...
                                'YTick', [],...
                                'XTickLabel', [],...
                                'YTickLabel', [],...
                                'XLim', [0 127],...
                                'YLim', [0 127],...
                                'NextPlot', 'add');
                            
            colormap(obj.viewAxes, 'Gray');
            
            % Get the path to the resource folder.
            resourcePath = fileparts(obj.parentFig.UserData);
            resourcePath = fullfile(resourcePath, 'resources');
            
            % Discover all .png images.
            try
                dirList = dir(resourcePath);
                for i = 1:size(dirList, 1)
                    fileName = dirList(i).name;
                    if regexp(fileName, '.png', 'once')
                        % Read the file and store it for viewing.
                        obj.cenaImg{end+1} = rgb2gray(flipud(imread(fullfile(resourcePath, fileName))));
                    end
                end
            catch
                % If something goes wrong; just use some magic.
                obj.cenaImg = {magic(128)};
            end
            
            % Give the axes something to display.
            obj.randomImage;
        end
        
        function obj = previousImage(obj)
            % FUNCTION
            
            obj.cenaIdx = obj.cenaIdx - 1;
            if obj.cenaIdx <= 0
            	obj.cenaIdx = size(obj.cenaImg, 2);
            end
            
            obj.drawImage;
        end
        
        function obj = randomImage(obj)
            % FUNCTION
            
            obj.cenaIdx = randi(size(obj.cenaImg, 2), 1);
            obj.drawImage;
        end
        
        function obj = nextImage(obj)
            % FUNCTION
            
            obj.cenaIdx = obj.cenaIdx + 1;
            if obj.cenaIdx > size(obj.cenaImg, 2)
            	obj.cenaIdx = 1;
            end
            
            obj.drawImage;
        end
        
        function drawImage(obj)
            % FUNCTION
            
            imagesc(obj.viewAxes, obj.cenaImg{obj.cenaIdx});
        end
        
        function changeColormap(obj, name)
            % FUNCTION
            
            colormap(obj.viewAxes, name);
        end
        
        function changeMinCLim(obj, value)
            % FUNCTION
            
            obj.viewAxes.CLim(1) = value;
        end
    end 
end