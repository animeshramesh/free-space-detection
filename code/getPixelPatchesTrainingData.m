function [X, Y] = getPixelPatchesTrainingData(k)
% k : # of neighbours for each pixel
% For 1st attempt, keep k=13

images = dir('../data/training/reshaped_imgs/*.png');

for num = 1:length(images)
    sampleCount=1;
    fprintf('Processing image %d\n',num);
    name = images(num).name;
    img = imread(strcat('../data/training/reshaped_imgs/', name));
    maskImg = imread(strcat('../data/training/masks/', name));
    maskImg=im2double(maskImg);
    h=size(img, 1);
    w=size(img, 2);
    for i=k+1:h-k
        for j=k+1:w-k
            patch=img(i-k:i+k, j-k:j+k,:);
            X(:,:,:,sampleCount)=patch;
            Y(sampleCount)=maskImg(i,j);
            sampleCount = sampleCount+1;
        end
    end
    fileName = strrep(name, '.png', '.mat');
    save(fileName, 'X', 'Y');
end
end

