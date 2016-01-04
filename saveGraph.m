%Allows the user to save the generated plot.
function saveGraph(hObject,handles)
    global PLOT;
    fileName = uiputfile('*.*','Save Plot As...');
    imwrite(PLOT,fileName);
end