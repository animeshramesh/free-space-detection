clear all
close all
clc

% patch size
k = 13;

% image rescale
scale = 0.25;

[X, Y] = getPixelPatchesTrainingData(k, scale);
[trainedNet,traininfo] = cnnTrain2(k,X,Y);

save('AllImageAttempt.mat','trainedNet','traininfo');