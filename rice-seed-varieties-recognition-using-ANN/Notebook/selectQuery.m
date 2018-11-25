clc
close all;

fidF = fopen('TestFeature.dat', 'w');
% select query image
pause(1);
[FileName, queryPathName] = uigetfile('*.jpg', 'Select a Test Image File','..\Dataset\Testing\');
if isequal(queryPathName, 0)
    msgbox('Image not Selected');
    return
end
imageFile = strcat(queryPathName, '\', FileName);

oriImage = imread(imageFile);

figure, imshow(oriImage); title('Original Image');

[tfeaturePattern] = featuresFile(oriImage);

fprintf(fidF, '%f ', tfeaturePattern);

fclose(fidF);

disp('Done');

