function [trainedNet,traininfo] = cnnTrain2(k,X,Y)

layers = [imageInputLayer([2*k+1 2*k+1 3]);
          convolution2dLayer(7,12);
          maxPooling2dLayer(2,'Stride',1);
          reluLayer();
          convolution2dLayer(5,6);
          reluLayer();
          fullyConnectedLayer(48);
          reluLayer();
          fullyConnectedLayer(192);
          reluLayer();
          fullyConnectedLayer(2);
          softmaxLayer();
          classificationLayer()];

options = trainingOptions('sgdm','MaxEpochs',20,...
          'LearnRateSchedule','piecewise',...
          'LearnRateDropFactor',0.8,... 
          'LearnRateDropPeriod',5,...
          'MiniBatchSize',512,...
          'InitialLearnRate',0.001,...
          'CheckpointPath','../checkpoints/');

Y = categorical(Y);
Y=Y';
[trainedNet,traininfo] = trainNetwork(X,Y,layers,options);

end