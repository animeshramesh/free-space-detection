function [patches] = getPatchesColor(img)

img = imresize(img, [376, 1240]);

r = size(img, 1);
c = size(img, 2);

patches = zeros(48, r*c/16);
k = 1;
for i = 1:4:r
    for j = 1:4:c
        curPatch = img(i:i+3, j:j+3, :);
        curPatch = curPatch(:);
        patches(:,k) = curPatch;
        k = k+1;
    end 
end
end

