function img = createImageFromPrediction(YPred,squarePatchLength,outSize)
% Ypred should be a vector - 1 = road, 0 = not road
% squarePatchLength - patch size
% outSize = size of the output image

% validate outsize
roadPatch = ones(squarePatchLength,squarePatchLength);
notRoadPatch = zeros(squarePatchLength,squarePatchLength);
img = zeros(squarePatchLength,squarePatchLength,1,numel(YPred));
if (outSize(1,1)*outSize(1,2) == squarePatchLength*squarePatchLength*numel(YPred))
    for i=1:numel(YPred)
        if (YPred(i)==1)
            img(:,:,:,i) = roadPatch;
        else
            img(:,:,:,i) = notRoadPatch;
        end
    end
   % img = reshape(img,outSize);
else
    fprintf('Output size is incorrect!\n');
end

montageSize = [outSize(1)/squarePatchLength outSize(2)/squarePatchLength];
montage(img,'Size',montageSize);