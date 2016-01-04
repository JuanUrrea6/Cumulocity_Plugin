%Allows the user to choose the line style for the plot.
%There are three possible returns for this function:
% 1: Selects Dashed Line Style
% 2: Selects Dotted Line Style
% 3: Selects Dash and Dot Line Style
function [lineStyle] = chooseLineStyle(hObject,handles)

    theOptions = {'Dashed';'Dotted';'Dash and Dot'};
    d = dialog('Position',[300 300 250 150],'Name','Select Line Style');
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'Position',[20 80 210 40],...
           'String','Line Styles');
       
    popup = uicontrol('Parent',d,...
           'Style','popup',...
           'Position',[75 70 100 25],...
           'String',theOptions,...
           'Callback',@popup_callback);
       
    btn = uicontrol('Parent',d,...
           'Position',[89 20 70 25],...
           'String','Apply',...
           'Callback','delete(gcf)');
       
    lineStyle = 'Dashed';
    uiwait(d);
   
       function popup_callback(popup,callbackdata)
          idx = popup.Value;
          popup_items = popup.String;
          lineStyle = char(popup_items(idx,:));
       end
end