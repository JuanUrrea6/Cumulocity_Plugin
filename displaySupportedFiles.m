%Displaying the information regarding the supported file types for
%uploading data.
function displaySupportedFiles(hObject,handles)
    cd('Text_Messages');
    theFile = fopen('fileSupportSpecifications.txt');
    supportedFiles = fgetl(theFile);
    theTitle = 'Instructions Regarding File Uploading';
    tline = fgetl(theFile);
    while ischar(tline)
        supportedFiles = strvcat(supportedFiles,tline);
        tline = fgetl(theFile);
    end
    fclose(theFile);
    createStructure.Interpreter = 'tex';
    createStructure.WindowStyle = 'modal';
    msgbox(supportedFiles,theTitle,'help',createStructure);
    cd('..');
end