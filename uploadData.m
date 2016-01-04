%Uploading data given by the user as .txt file
function uploadData(hObject,handles)
   global DATA;
   [filename, pathname] = uigetfile('*.txt');
   completeName = fullfile(pathname, filename);
   theFile = fopen(completeName);
   rawData = fgetl(theFile);
   tline = fgetl(theFile);
   cleanData = strsplit(rawData,',');
   dataArray = [str2num(cell2mat(cleanData(1))) str2num(cell2mat(cleanData(2)))];
   while ischar(tline)
       cleanTime = strsplit(tline,',');
       actual = [str2num(cell2mat(cleanTime(1))) str2num(cell2mat(cleanTime(2)))];
       dataArray = vertcat(dataArray,actual);
       tline = fgetl(theFile);
   end
   fclose(theFile);
   DATA = dataArray;
end