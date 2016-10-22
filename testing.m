img = imread('data_road/training/image_2/umm_000000.png');

img = imresize(img, [376, 1240]);

r = size(img, 1);
c = size(img, 2);

res = zeros(r,c);

patches = zeros(48, r*c/16);
for i = 1:4:r
    for j = 1:4:c
        curPatch = img(i:i+3, j:j+3, :);
        curPatch = curPatch(:);
        inp = cell(1);
        inp{1} = double(curPatch);
        [label,~,~] = myNeuralNetworkFunction(inp);
        if label{1,1} > 0.7
            res(i:i+3, j:j+3) = 255;
        end
    end 
end
imshow(res);