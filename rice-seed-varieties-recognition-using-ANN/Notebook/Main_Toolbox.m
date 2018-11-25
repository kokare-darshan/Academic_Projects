clc;
close all;
clear all;

warning off all;

Repeat = 1;
while(Repeat)
    choice = menu('Rice Analysis', 'Feature Extraction','ANN Training',...
        'Select Query','ANN Classification','Exit');
    
    switch choice
        case 1
            disp('Creating Database');
            featureCollection;
            
        case 2
            disp('ANN Training')
            annTraining;
            
        case 3
            disp('Select a Query Image')
            selectQuery;
            
        case 4
            disp('ANN Classify')
            annClassify;
            
        case 5
            close all;
            clear all;
            clc;
            
            Repeat = 0;
    end
end

disp('Have a Nice Day...');

