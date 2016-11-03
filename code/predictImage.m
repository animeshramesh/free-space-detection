function [YPred, X] = predictImage(img, net, squarePatchLength)
% Makes a prediction for the given image
% X - Input image
% net - Trained network 
% Returns a binary image where the road segments are white


% Extract patches from image
numPatches = 384*1248/squarePatchLength/squarePatchLength;
%X = zeros(squarePatchLength,squarePatchLength,3,numPatches);
[patches, ~] = createPatchesFromImage(img, squarePatchLength, []);
for i=1:size(patches,1)
    X(:,:,:,i) = patches{i};
end

size(X)
YPred = predict(net,X);
end

