function [X,Y] = createXYfromPatches(squarePatchLength)

% input - squarePatchLength (will look for image patches of this size from
% the training data)
% output - X - training data in 4D format, Y - training labels

    fullPath = strcat('../data/training/patches/',strcat(num2str(squarePatchLength),'x',num2str(squarePatchLength)));

    roadCounter = 1;
    notRoadCounter = 1;
    if(exist(fullPath,'dir')==7) % 7 for folders
        patchfiles = dir(strcat(fullPath,'/*.mat'));
        numPatches = 384*1248/squarePatchLength/squarePatchLength;
     %    X = zeros(squarePatchLength,squarePatchLength,3,length(patchfiles)*numPatches);
      %  Y = cell(numPatches*length(patchfiles),1);
        for i = 1:length(patchfiles)
            i
            filename = strcat(fullPath,'/',patchfiles(i).name);
            load (filename);
            for j=1:numPatches
                if(strcmp(labelPatches{j},'road'))
                    Xroad(:,:,:,roadCounter) = patches{j};
                    Yroad{roadCounter,1} = labelPatches{j};
                    roadCounter = roadCounter + 1;
                else
                    XnotRoad(:,:,:,notRoadCounter) = patches{j};
                    YnotRoad{notRoadCounter,1} = labelPatches{j};
                    notRoadCounter = notRoadCounter + 1;
                end     
            end
        end
    else
        fprintf('Folder does not exist.\n');
    end

% split the data set equally
    minDataSize = min(size(Yroad,1),size(YnotRoad,1));
    % Im gonna do something very naive to start with
    % alternating elements are road and not road
    k = 1;
    for i=1:2:2*minDataSize
        X(:,:,:,i) = Xroad(:,:,:,k);
        X(:,:,:,i+1) = XnotRoad(:,:,:,k);
        Y(i,1) = Yroad(k,1);
        Y(i+1,1) = YnotRoad(k,1); 
        k = k + 1;
    end
    a=0;
end

