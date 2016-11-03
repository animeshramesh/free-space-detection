% read all image files
imagefiles = dir('../data/training/gt_image_2/*.png');

% make new folder to store masks. 
mkdir('../data/training','masks');
for i = 1:length(imagefiles)
    i
    name = imagefiles(i).name;
    
    % Ignore lane markers
    if strfind(name,'lane')
        continue;
    end
    
    img = imread(strcat('../data/training/gt_image_2/', name));
    img = imresize(img, [384, 1248]);
    img = im2double(img);
    map = zeros(size(img,1), size(img, 2));
    for j = 1:size(img,1)
        for k = 1:size(img, 2)
            if img(j,k,3) > 0.9
                map(j,k) = 255;
            end
        end
    end
    
    newName = strrep(name,'_road','');
    imwrite(map, strcat('../data/training/masks/',newName));
end
