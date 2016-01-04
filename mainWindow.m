%Main app for data analysis.
function mainWindow
%%
%Here goes the construction of the main app for data analysis. First, the
%main structure is built.
%START-UP Parameters
dims = get(0,'ScreenSize');
mainFigure = figure('MenuBar','none','ToolBar','none','Name','Data Analysis App',...
    'Position',dims,'Color','Black','NumberTitle','off');

%THE DATA
global DATA;
global PLOT;
global LINESTYLE;
global LINECOLOR;
global XLABEL;
global YLABEL;
global TITLE;

%UPLOAD DATA Menu
%The construction of the menu which allows the user to upload tha data that
%will be analyzed.
uploadMenu = uimenu('Parent',mainFigure,'Label','Upload Data','Separator','on',...
    'Callback',@uploadData);
%--------------------------------------------------------------------------
%PLOT PROPERTIES Menu
%Construction of the menu that allows the user to customize the plot
%generated form the data.
customizeMenu = uimenu('Parent',mainFigure,'Label','Plot Properties');
lineMenu = uimenu('Parent',customizeMenu,'Label','Line Properties');
lineStyleMenu = uimenu('Parent',lineMenu,'Label','Line Style',...
    'Callback',@selectLineStyle);

    function selectLineStyle(hObject,handles)
        choice = chooseLineStyle;
        finalChoice = '-.';
        if(strcmp(choice,'Dashed'))
            finalChoice = '--';
            disp('Hola');
        end
        if(strcmp(choice,'Dotted'))
            finalChoice = ':';
        end
        if(strcmp(choice,'Dash and Dot'))
            finalChoice = '-.';
        end
       LINESTYLE = finalChoice;
    end
%--------------------------------------------------------------------------
%INFO Menu
%The construction of the menu that will contain all the information
%regarding the purpose and functionality of this app.
%Main ABOUT menu option
infoMenu = uimenu('Parent',mainFigure,'Label','About','ForegroundColor','Black',...
    'Separator','on');
fileTypeInfo = uimenu('Parent',infoMenu,'Label','Supported Files',...
    'Callback',@displaySupportedFiles);

%PLOTTING PANNEL
%Construction of a pannel which contains tabs for the multiple plotting
%possibilities of X and Y Data.
plotPannelPos = [0.01 0.72 0.4 0.25];
plotPanel = uipanel('Title','Data Plotting','BackgroundColor','Black',...
    'Position',plotPannelPos,'ForegroundColor','White','Parent',mainFigure);
axesPosition = [0.1 0.1 0.5 0.8];
plotAxes = axes('Parent',plotPanel,'Position',axesPosition,'XGrid','on',...
    'YGrid','on','XColor','White','YColor','White','GridColor','Black',...
    'GridLineStyle','--','Tag','plotAxes');
plotButtonPosition = [450 168 200 50];
plotButton = uicontrol('Style','pushbutton','String','Plot Data',...
    'Parent',plotPanel,'Position',plotButtonPosition,'Callback',@plotData);
saveButtonPosition = [450 110 200 50];
handles.saveImage = uicontrol('Style','pushbutton','String','Save Graph',...
    'Parent',plotPanel,'Position',saveButtonPosition,'BackgroundColor',[168/255 228/255 247/255],...
    'Callback',@saveGraph);

    function plotData(hObject,handles)
        currentAxes = findobj('Tag','plotAxes');
        plot(currentAxes,DATA(:,1),DATA(:,2),LINESTYLE);
        currentAxes.XGrid = 'on';
        currentAxes.YGrid = 'on';
        currentAxes.XColor = 'White';
        currentAxes.YColor = 'White';
        currentAxes.GridColor = 'Black';
        currentAxes.XLim = [min(DATA(:,1)) max(DATA(:,1))];
        currentAxes.YLim = [min(DATA(:,2)) max(DATA(:,2))];
        currentAxes.GridLineStyle = '--';
        currentAxes.Units = 'pixels';
        pos = currentAxes.Position;
        ti = currentAxes.TightInset;
        rect = [-ti(1), -ti(2), pos(3)+ti(1)+ti(3), pos(4)+ti(2)+ti(4)];
        theFrame = getframe(currentAxes,rect);
        PLOT = theFrame.cdata;
    end
end
