function featureExtraction(fidF, fidO, pathName, outType)

hWaitBar = waitbar(0, 'Please wait...', 'Name','Creating Database.', 'Position', [500 80 280 50]);

files = dir([pathName '\' '*.jpg']);
numFiles = numel(files);
for i = 1:numFiles
    fileName = files(i).name;
    imgFileName = strcat(pathName, '\', fileName);
    imgRGB = imread(imgFileName);
    figure, imshow(imgRGB); title('Original Image');
    [featurePattern] = featuresFile(imgRGB);
    %% writing in file
    fprintf(fidF, '%f ', featurePattern);
    fprintf(fidF, '\n');
    fprintf(fidO, '%s\n', outType);
    waitbar(i/numFiles, hWaitBar);
    pause(0.1);
    close all
end

close(hWaitBar);
disp('Done: Feature Extraction...');

