function [X, Y] = getPixelPatchesTrainingData(k, scale)
% k : # of neighbours for each pixel
% For 1st attempt, keep k=13

imagefiles = dir('../data/training/reshaped_imgs/*.png');
sampleCount=1;
%X = [];
%Y = [];
for num = 1:length(imagefiles)
    num
    name = imagefiles(num).name;
    %name = images(num).name;
    img = imresize(imread(strcat('../data/training/reshaped_imgs/', name)),scale);
    maskImg = imresize(imread(strcat('../data/training/masks/', name)),scale);
    maskImg=im2double(maskImg);
    h=size(img, 1);
    w=size(img, 2);
    % for i=k+1:h-k
    for i=2*k+1:h
        for j=k+1:w-k
            %patch=img(i-k:i+k, j-k:j+k,:);
            patch=img(i-2*k:i, j-k:j+k,:);
            X(:,:,:,sampleCount)=patch;
            if (maskImg(i,j)>0.8)
                Y(sampleCount)=1;
            else 
                Y(sampleCount)=0;
            end
            sampleCount = sampleCount+1;
        end
    end
end
   % save('imagePatches.mat','X','Y');
end

