function createPatchDriver(squarePatchLength)

% function to create patches for all images
mkdir('../data/training/patches',strcat(num2str(squarePatchLength),'x',num2str(squarePatchLength)));
% read all image files
imagefiles = dir('../data/training/image_2/*.png');
for i = 1:length(imagefiles)
    i
    name = imagefiles(i).name;
    img = imread(strcat('../data/training/image_2/', name));
    maskImg = imread(strcat('../data/training/masks/', name));
    [patches,labelPatches] = createPatchesFromImage(img,squarePatchLength,maskImg);
   
    fullPath = strcat('../data/training/patches/',strcat(num2str(squarePatchLength),'x',num2str(squarePatchLength)));
    name = strrep(name,'.png','');
    matfilename = strcat(strcat(fullPath,'/',name),'_patches.mat');
    save(matfilename,'patches','labelPatches');
end

