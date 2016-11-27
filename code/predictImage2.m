function resultImg = predictImage2(img, k, net)

h=size(img,1);
w=size(img,2);
resultImg=zeros(size(h-2*k, w-2*k));

for i=k+1:h-k
    fprintf('Predicting row %d\n', i);
    for j=k+1:w-k
        X=img(i-k:i+k, j-k:j+k,:);
	    [YPred,~] = classify(net,X);
	    resultImg(i-k, j-k)=YPred;
    end
end 
end