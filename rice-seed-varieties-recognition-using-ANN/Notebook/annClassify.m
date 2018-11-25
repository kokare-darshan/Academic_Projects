function annClassify

load TestFeature.dat;

TestFeature = mapminmax(TestFeature);
TestFeatureS = TestFeature';

load net_FFBP;

%% Testing the classifier
% The trained neural network can now be tested with the testing samples
% This will give us a sense of how well the network will do when applied
% to data from the real world.

OutType = simNet(net_FFBP, TestFeatureS);

%%
% The network response can now be compared against the desired target
% response to build the classification matrix which will provides a
% comprehensive picture of a classifiers performance.

if OutType(1) == 1
    msgbox('Delhi Rice');
    
elseif OutType(2) == 1
    msgbox('Sonamasuri Rice');
    
elseif OutType(3) == 1
    msgbox('Sonamasuri Rice');

elseif OutType(4) == 1
    msgbox('Sonamasuri Rice');

else
    classifiedFlag = -1;
    msgbox('Cant Classify');
end

%% End

disp('Done: Classification');

