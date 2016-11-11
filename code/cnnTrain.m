function [trainedNet,traininfo] = cnnTrain(squarePatchLength,X,Y)

%% creating patches
if nargin < 3
    [X,Y] = createXYfromPatches(squarePatchLength);
end
% %% input layer
% Attempt 1 - does not work
% inputLayer = imageInputLayer([squarePatchLength squarePatchLength 3]);
% 
% %% Layer 1
% numFilterConv1 = 32;
% filterSizeConv1 = 5;
% conv1 = convolution2dLayer(filterSizeConv1,numFilterConv1,'Stride',1);
% relu1 = reluLayer('Name','relu1');
% maxpool1 = maxPooling2dLayer(2,'Stride',1); 
% 
% %% Layer 2
% conv2 = convolution2dLayer(filterSizeConv1,numFilterConv1*2,'Stride',1);
% relu2 = reluLayer('Name','relu2');
% maxpool2 = maxPooling2dLayer(2,'Stride',1); 
% 
% %% FC layer
% fc1 = fullyConnectedLayer(128);
% relu3 = reluLayer('Name','relu3');
% fc2 = fullyConnectedLayer(2);
% softmax1 = softmaxLayer();
% fprintf('creating classification layer...\n');
% coutputLayer = classificationLayer();
% 
% 
% %% layers
% layers = [inputLayer;
%           conv1;
%           relu1;
%           maxpool1;
%           conv2;
%           relu2;
%           maxpool2;
%           fc1;
%           relu3;
%           fc2;
%           softmax1;
%           coutputLayer
%           ];
 
% Attempt 2 - does not work
% layers = [imageInputLayer([squarePatchLength squarePatchLength 3]);
%           convolution2dLayer(5,20);
%           reluLayer();
%           maxPooling2dLayer(2,'Stride',1);
%           fullyConnectedLayer(2);
%           softmaxLayer();
%           classificationLayer()];

% Attempt 3
layers = [imageInputLayer([squarePatchLength squarePatchLength 3]);
          fullyConnectedLayer(squarePatchLength^2);
          fullyConnectedLayer((squarePatchLength^2)/2);
          fullyConnectedLayer((squarePatchLength^2)/4);
          %fullyConnectedLayer((squarePatchLength^2)/8);
          fullyConnectedLayer(2);
          softmaxLayer();
          classificationLayer()];
checkpointDir = strcat('../checkpoints/',num2str(squarePatchLength),'x',num2str(squarePatchLength));
      mkdir(checkpointDir);
% options = trainingOptions('sgdm',...
%       'LearnRateSchedule','none',... 
%       'MaxEpochs',200,... 
%       'MiniBatchSize',1024,...
%       'CheckpointPath',checkpointDir);

options = trainingOptions('sgdm','MaxEpochs',20,...
	'InitialLearnRate',0.001);

fprintf('Training...\n');
Y = categorical(Y);
[trainedNet,traininfo] = trainNetwork(X,Y,layers,options);
end

