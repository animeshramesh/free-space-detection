function [YPred,scores, X] = predictImage(img, net, squarePatchLength)
% Makes a prediction for the given image
% X - Input image
% net - Trained network 
% Returns a binary image where the road segments are white


% Extract patches from image
[patches, ~] = createPatchesFromImage(img, squarePatchLength, []);
for i=1:size(patches,1)
    X(:,:,:,i) = patches{i};
   % imshow(X(:,:,:,i));
    [YPred(i),scores(i,:)] = classify(net,X(:,:,:,i));
end
end

