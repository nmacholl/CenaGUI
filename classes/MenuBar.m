classdef MenuBar < handle
    %MENUBAR File menu bar for the CenaGUI.
    
    properties(SetAccess = 'private')
        % Parent figure to hold the list.
        parentFig = [];
        
        % File Menu
        file = [];
        fileExit = [];
        
        % File About
        about = [];
        aboutSource = [];
        aboutBlurb = [];
    end
    
    methods
        function obj = MenuBar(parent)
            % CONSTRUCTOR
            
            obj.parentFig = parent;
            
            % File Menu
            obj.file = uimenu('Parent', obj.parentFig,...
                              'Label', 'File');
            obj.fileExit = uimenu('Parent', obj.file,...
                                  'Label', 'Exit',...
                                  'UserData', obj.parentFig,...
                                  'Callback', @(obj, e)close(obj.UserData));
                              
            % About Menu
            obj.about = uimenu('Parent', obj.parentFig,...
                               'Label', 'About');
            obj.aboutSource = uimenu('Parent', obj.about,...
                                  'Label', 'View Source on GitHub',...
                                  'Callback', 'web https://github.com/nmacholl/CenaGUI');
            obj.aboutBlurb = uimenu('Parent', obj.about,...
                                    'Label', 'Nick Macholl 2016',...
                                    'Enable', 'off');
        end
    end
    
end

