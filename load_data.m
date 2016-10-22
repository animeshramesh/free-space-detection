train_dir = 'data_road/training/image_2/';
test_dir = 'data_road/training/gt_image_2/';

imagefiles = dir('data_road/training/image_2/*.png');
n = length(imagefiles);

x = [];
y = [];

for i = 1:5
%     i
    name = imagefiles(i).name
    train_img = imread(strcat(train_dir, name));
    test_img = imread(strcat(strcat(test_dir,'custom_'), name));
    
    train_patches = getPatchesColor(train_img);
    labels = getLabels(test_img);
    
    x = [x train_patches];
    y = [y labels];
 
end
save('dataset.mat', 'x', 'y');