function annTraining

%% load the features
load Features.dat

%% load output type
load Outtype.dat;

%% feed forward network
% A 1-hidden layer feed forward network is created with 20 neurons in the
% hidden layer.

hneurons = [52 24 2];

%initialize parameters for creating the MLP.
fcnCELL = {'logsig' 'logsig'};
trainalgo = 'gdm';
paramatrix = [1000 50 0.9 0.8]; % learning rate = 0.9, momentum term = 0.6, show = 50 , epochs = 100
goalParam = 0.003;

[net_FFBP, FeatureS, OuttypeS] = createNet(Features, Outtype, hneurons, fcnCELL, trainalgo, paramatrix, goalParam, 1);

%%
% Now the network is ready to be trained. The samples are automatically
% divided into training, validation and test sets. The training set is
% used to teach the network. Training continues as long as the network
% continues improving on the validation set. The test set provides a
% completely independent measure of network accuracy.

[net_FFBP] = train(net_FFBP, FeatureS, OuttypeS);

save net_FFBP net_FFBP;

disp('Done: Training Network');

