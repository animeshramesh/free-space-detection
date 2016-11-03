function [X,Y] = createXYfromPatches(squarePatchLength)

% input - squarePatchLength (will look for image patches of this size from
% the training data)
% output - X - training data in 4D format, Y - training labels

fullPath = strcat('../data/training/patches/',strcat(num2str(squarePatchLength),'x',num2str(squarePatchLength)));

if(exist(fullPath,'dir')==7) % 7 for folders
    patchfiles = dir(strcat(fullPath,'/*.mat'));
    numPatches = 384*1248/squarePatchLength/squarePatchLength;
 %    X = zeros(squarePatchLength,squarePatchLength,3,length(patchfiles)*numPatches);
    Y = cell(numPatches*length(patchfiles),1);
    for i = 1:length(patchfiles)
        i
        filename = strcat(fullPath,'/',patchfiles(i).name);
        load (filename);
        for j=1:numPatches
            X(:,:,:,(i-1)*numPatches+j) = patches{j};
        end
        Y((i-1)*numPatches+1:i*numPatches,1) = labelPatches;
    end
else
    fprintf('Folder does not exist.\n');
end
end

