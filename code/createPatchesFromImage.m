function [patches, labelPatches] = createPatchesFromImage(img, squarePatchlength, maskImg)

%% Input
% img = input image
% squarePatchlength is the size of the square patch that needs to be created. 
% labelimg = binary image that contains road labels 
%% Output
% patches is a cell of size (numPatches X 1)
% labelpatches is a cell of size(numPatches X 10 where each label element
% is 'road' or 'not road'. 

%%
img = imresize(img, [384, 1248]);
patches = cell(size(img, 1)*size(img, 2)/(squarePatchlength*squarePatchlength),1);
labelPatches = cell(size(img, 1)*size(img, 2)/(squarePatchlength*squarePatchlength),1);
patchNo = 1;
rowPatch = 1:squarePatchlength:size(img, 1);
colPatch = 1:squarePatchlength:size(img, 2);
for i = rowPatch
    for j = colPatch;
        curPatch = img(i:i+squarePatchlength-1, j:j+squarePatchlength-1, :);
        patches{patchNo} = curPatch;
        
        if ~isempty(maskImg)
            curMask = im2double(maskImg(i:i+squarePatchlength-1, j:j+squarePatchlength-1));
            label = (sum(sum(curMask==1))>(squarePatchlength^2)/2);
            if(label)
                labelPatches{patchNo} = 'road';
            else
                labelPatches{patchNo} = 'not_road';
            end
        end 
        patchNo = patchNo+1;
    end 
end
end
