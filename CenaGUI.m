function [fig] = CenaGUI()
%CENAGUI Demonstration MATLAB GUI.
%   This GUI serves as an example of a GUI written line by line.

    %% Create Figure
    fig = figure('Name', 'CenaGUI',... Set the figure's name.
                 'NumberTitle', 'off',... Remove the figure number.
                 'MenuBar', 'none',... Remove the usual toolbar.
                 'Units', 'normalized',... Set units to normalized.
                 'Position', [0.2 0.1, 0.4, 0.4],... Set figure position and size.
                 'UserData', mfilename('fullpath'),... I usually store the run path here.
                 'HandleVisibility', 'callback');
             
    % HandleVisiblity set to callback is important. It prevents the user
    % from accidentally messing with our GUI; such as plotting a figure to
    % an axis we are using.
    
    %% Create Handle Structure
    handles = struct();
    
    %% Create Children
    handles.cenaViewer = CenaViewer(fig);
    handles.colormapPicker = ColormapPicker(fig);
    handles.levelSlider = LevelSlider(fig);
    handles.cenaQuoter = CenaQuoter(fig);
    handles.imageControls = ImageControls(fig);
    handles.menuBar = MenuBar(fig);
    
    % Give initial focus to the colormap picker.
    handles.colormapPicker.setFocus;
    
    %% Setup Callbacks
    % You can initialize these with the figure if you desire.
    % This callback prints a message when the GUI is closed.
    fig.DeleteFcn = @closeGUI;
    
    %% Commit Handles
    guidata(fig, handles);
end

%% Figure Callbacks
function closeGUI(~, ~)
    disp('Have a nice day!');
end
