function [onet, FeatureS, OuttypeS] = createNet(Features, Outtype, hneurons, fcnCELL, trainalgo, paramatrix, goalParam)

% Creates and initializes a neural network with given parameters.
%
% Algorithm:
% Standard neural network initialization
%

FeatureS = Features';    %Convert to column array

OuttypeS = Outtype';

inputsize = size(FeatureS, 1);
min_data = min(min(FeatureS));
max_data = max(max(FeatureS));
mimax = [min_data max_data];

sameWEIGHT = [];

%create min & max values Rx2 matrix for inputs!
mm = ones(inputsize,2);
mm = [mm(:,1).*mimax(1) mm(:,2).*mimax(2)];

%create the fully connected feed-forward network.
onet = newff(mm, hneurons);

%define Transfer function for the 2 layers
onet.layers{1}.transferFcn = fcnCELL{1};
onet.layers{2}.transferFcn = fcnCELL{2};

%Initialize weights
onet.initFcn = 'initlay';
onet.layers{[1 2]}.initFcn = 'initwb';

onet.inputWeights{1,1}.initFcn = 'rands';
onet.biases{1}.initFcn = 'rands';

onet.layerWeights{2,1}.initFcn = 'rands';
onet.biases{2}.initFcn = 'rands';


%Our network is designed for batch-training.
%So we define our global training function &
%its parameters e.g. momentum, learning rate..etc.
epochs = paramatrix(1);
show = paramatrix(2);
lr = paramatrix(3);
mc = paramatrix(4);

onet.trainFcn = 'traingdm';
%onet.trainParams.min_grad=;
%onet.trainParam.max_fail=max_fail;
onet.trainParam.lr = lr;
onet.trainParam.mc = mc;
onet.trainParam.show = show;
onet.trainParam.epochs = epochs;

%Define the succesful convergence point
onet.trainParam.goal = goalParam;

%Define the Performance function
onet.performFcn = 'mse';

%INITIALIZE WEIGHTS & BIASES
onet=init(onet);
onet.LW{2,1} = sameWEIGHT;

