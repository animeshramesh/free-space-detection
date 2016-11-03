function [trainedNet,traininfo] = cnnTrain(X,Y,squarePatchLength)

fprintf('creating input layer...\n');
inputLayer = imageInputLayer([squarePatchLength squarePatchLength 3]);

numFilterConv1 = 16;
filterSizeConv1 = 4;
fprintf('creating conv layer...\n');
conv1 = convolution2dLayer(filterSizeConv1,numFilterConv1,'Stride',4);
fprintf('creating reLU layer...\n');
relu1 = reluLayer('Name','relu1');
fprintf('creating maxpool layer...\n');
maxpool1 = maxPooling2dLayer(2,'Stride',2);   
fprintf('creating fc layer...\n');
fc1 = fullyConnectedLayer(2);
fprintf('creating softmax layer...\n');
softmax1 = softmaxLayer();
fprintf('creating classification layer...\n');
coutputLayer = classificationLayer();



layers = [inputLayer;
          conv1;
          relu1;
          maxpool1;
          fc1;
          softmax1;
          coutputLayer
          ];
      
checkpointDir = strcat('../checkpoints/',num2str(squarePatchLength),'x',num2str(squarePatchLength));
      mkdir(checkpointDir);
options = trainingOptions('sgdm',...
      'LearnRateSchedule','piecewise',...
      'LearnRateDropFactor',0.2,... 
      'LearnRateDropPeriod',5,... 
      'MaxEpochs',30,... 
      'MiniBatchSize',1024,...
      'CheckpointPath',checkpointDir);

fprintf('Training...\n');
Y = categorical(Y);
[trainedNet,traininfo] = trainNetwork(X,Y,layers,options);
end

