function [labels] = getLabels(img)
img = imresize(img, [376, 1240]);
img = im2double(img);
r = size(img, 1);
c = size(img, 2);

labels = zeros(r*c/16,1)';
k = 1;
for i = 1:4:r
    for j = 1:4:c
        curPatch = img(i:i+3, j:j+3);
        curPatch = curPatch(:);
        labels(k) = max(curPatch);
        k = k+1;
    end 
end
end

