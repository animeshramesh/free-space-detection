function [resultImg, segmentationMask, segmentation, alpha] = predictImage2(img,mask, k, scale, net)
img = imresize(img,scale);
mask= imresize(mask,scale);
mask = im2double(mask);
h=size(img,1);
w=size(img,2);

resultImg=zeros(size(h, w));
segmentationMask=mask;
segmentation=img;
alpha = ones(size(img,1),size(img,2),size(img,3));

%for i=k+1:h-k
for i=2*k+1:h
    fprintf('Row %d\n',i);
    for j=k+1:w-k
        X=img(i-2*k:i, j-k:j+k,:);
	    [~,scores] = classify(net,X);
        YPred = find(scores == max(scores));
	    resultImg(i, j-k)=(YPred==2);
        if (YPred == 2)
            alpha(i,j-k,:)=[0.5,0,0];
            segmentationMask(i,j-k,:)=0.5; 
            segmentation(i,j-k,:)=[255,0,0]; 
        end
    end
end 
end